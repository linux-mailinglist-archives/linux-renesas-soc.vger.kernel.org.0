Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521B03B2C86
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 12:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbhFXKi1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 06:38:27 -0400
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:3695
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231373AbhFXKi0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 06:38:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsImMYv4gWjcjafK3mgo8BFhWGYqTNysoBREwR2KTyKFBXILOjQpyV/6QEmwE3xnKl0LdHlcuTQyeLJNo3leGROqErP+HHAHFQrJW2Z2xOadtwH5hQTb9rrka3tP98b6rDoPBtRBnn2CrihgWreCZSVKexdDAD/w3ORj+wgVXXzabDzBNvg51Klic+bOVB7dbhVbCy9aIHGWTtkOxqyT9DzeEZ5uYcG2VxdzJoSchea6SiXRd5aljvmgC9R94RCACorzHC45ckVx9PGhGVHKszN5Zb1YEQf7VzH+8MsV652hfpCXEwEiZCIuFsEfpi/O/ImjAbLDDzIwekPNz91qCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTQEGhtsyfP5QHDZWfb5sXP6nNt7vt3tPjjWQq0WpmM=;
 b=UrebERaOwT4KMpxEI0ZZQygwbYRij9qP204G4/FWq6/hc1D74NO/4KVAF+K8FvDzFLujC7uT2kq1hiIT85Q1kVZQJNNnt6/SjFSG7PKumMbGCKWjCN4K4WD/Hr9zCPeyE3posiLh3QWUeyC33SiexM3hIQ/4EAfBTazXQ859Rz+noIj7jaJpW/vLARxzjiZKxTfjkTAemXzgye+aqurZt9UhYMcwjW0Hfp/aC7w3hiuCMupjXlIKsl9WjUFHCekCpyzaMR780M/fEKY/5rMLtmbHKUl4erUpcvYey8ob87JrkqYLGoX6k4jtbxjFj5hlIFZHKvtVv/RBv17AjSH3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTQEGhtsyfP5QHDZWfb5sXP6nNt7vt3tPjjWQq0WpmM=;
 b=q2cH8f28A4BFtoOzW23T5CNmCneVgJHqK/OvJw7cCnUYNsbaxBjb3u21RI5SL+rSDsiovDOg7NiKySB3uPlecCXOVN3Pl8mp+E5WMxsBR2M1+UmVfDDFLy5R84nGru9SNbb0HW+XPFg0SIWoHxNESfJ8mPIwNnqEUFuYTZv3JT8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5386.jpnprd01.prod.outlook.com (2603:1096:404:803f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 24 Jun
 2021 10:36:05 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 10:36:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH RFC] usb: renesas_usbhs: fifo: : use proper DMAENGINE API
 for termination
Thread-Topic: [PATCH RFC] usb: renesas_usbhs: fifo: : use proper DMAENGINE API
 for termination
Thread-Index: AQHXaBb4DCoFDFqLl0Gk0IEvbdRVSKsiXRSggABNYwCAAE4ZUA==
Date:   Thu, 24 Jun 2021 10:36:05 +0000
Message-ID: <TY2PR01MB369273ACD098AD2868923A6ED8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210623100304.3697-1-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692C7B6E0FD027B5C3E05B5D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <YNQd9hS+hqPYvLNp@kunai>
In-Reply-To: <YNQd9hS+hqPYvLNp@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26947436-31e6-4f0d-ae70-08d936fbded9
x-ms-traffictypediagnostic: TYAPR01MB5386:
x-microsoft-antispam-prvs: <TYAPR01MB538622347E7F3DAE4176E91DD8079@TYAPR01MB5386.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sm6ybspPKdcu6KWjnGUUCnThhpWBPGIxnL+uiejgwsl7aIpUqR/xoF2AGVCpVxvZLltEVglaA58d8GhFeEA6hJENhBOlQW8FMImpmHhhTAQHAMZPUl+aKTaZq39TAk3AjVQnfbqhaEyEYhoXLqzcCSBT2Bd2fLeHyLGhfcDttMNoRt/BtGiESj42vVSMZNDqxzN3C5Px/WvoTb5oNHkV5sCOHqEPZ7167Gus582GW2p0dEi5EPf4S1Zt/Q7RWDjadXNui+sX01kXntvKlp4a+4K8J3/kwEuNKDp1cQcL+bZRlMQR7S50hAipIIceJFL4KVp7GxkXRyyN9oEYcM/863B1WuOw+Gjsku5NxOMQrhNNZa+WfwAmCXfnGO1OqqEHQs7Z6z6YiQbtFo2myaEojCHaB9GAJjv9qPEmHciGw6GcWf6C0TZrFwXRj6v74J/5frYzJrynMi7eWr6Qik/7CX5h9bF5IG1+uLYCQG3skkV6idSOypxttsVQas3kzy6I50A++t/2RbXITTDXg0Rm1eIq1W7VJpbR9P+gqMOT71yXbwsG/w2EW6Bzg9uS5VQURvQhbvAx45ZfsjGYO2c0zo8+9/KDMkbzBcYboXqYgik=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(4744005)(64756008)(71200400001)(5660300002)(66946007)(66446008)(52536014)(76116006)(8936002)(66476007)(8676002)(66556008)(9686003)(2906002)(6506007)(86362001)(316002)(26005)(55016002)(38100700002)(55236004)(33656002)(7696005)(478600001)(122000001)(186003)(4326008)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?umoIRURi07SKkAtj8FhnD5vtItwXDJ+NP7WNPeHl9tyfqggFuAbZcGtVeEvA?=
 =?us-ascii?Q?qgv6ysVtdVLfM86Pos7fGBl2E1LRNVdjjjwJodviRBp20PwNEZ5p8zAqxip9?=
 =?us-ascii?Q?/YnQpy1ToanLdRU6Un9bzVkABt3GAetf0JnQNriyVtrT3Jnu4XVKujrmetiF?=
 =?us-ascii?Q?jdTwbA/U0RlY1pYMyZKURmExFF4SrxfFHkLeZJ7Vb2NwWqFBAfDGUVlm4lxI?=
 =?us-ascii?Q?Yo4JJTs7WUjhPi0ae+0FOv8cBcxzAVb8qTykoIGExTTD891yL6YDmCG+yuLW?=
 =?us-ascii?Q?BVV799M/fJpRxMVZVKPiA3uic2mg9URhzabGv0U/TwwLivmHxY++sHTlq1Au?=
 =?us-ascii?Q?BQtxGtrc95keZMvWUJKDq7twNNlX1rUjH2BUyweslpKVImA8zXMOSbQNaHJ5?=
 =?us-ascii?Q?w7Webm+mFhZEIlwuNolHHif/1p3IjpZH7tQ42tiwMWeAm1krTJouyu6Rh0gB?=
 =?us-ascii?Q?Ag424T6S010u8mMqYe2AZm4BLDhCHVgf7DpwZ7m5lnloiU6dCE6XXaK4hToJ?=
 =?us-ascii?Q?430aIIDZvbrxM907e2doivOR2paJ3va+yiw/nHsF7LhbU7uumhIYdVchjxRI?=
 =?us-ascii?Q?vjYY/aypHYX40e72BdJjd+I6Ms+4joWIyOUbOtapBwOgdTsYntXltWKYkaaR?=
 =?us-ascii?Q?LXZHbRPBtry8W6tADdDwXu6ybEV49H8eiwy7hsPoX7vnKUSIVLMreA6XGA01?=
 =?us-ascii?Q?6hQfWWNH95+Zxie8wuv1ycL7wwSYLQ0uv3DNJ3aKzHSaGnBo72Etvux03W8c?=
 =?us-ascii?Q?Bb51Lm1kzH9DfczKHFVeRJUQeXScgOjVZzhGYZiekY1v263z7UbmC1rH+8F6?=
 =?us-ascii?Q?rpZ3onROcwu+Wo/1JrVI5oz/U71Mzd5eZ7Ud5fDXHrkibdvk+OB8FHl51fDi?=
 =?us-ascii?Q?e2hq1tZS5WAM1JXhoMPyhEBETiRJma4Stuxsdt/CMSd+ekyEMuNr4f+PYenJ?=
 =?us-ascii?Q?bM8fkaNQ5yW9vCdI2rHMeTr5sJAoisKmfrc4eBNY1f3aFUwepxqmThsbrNO7?=
 =?us-ascii?Q?3h403pDQynPj31r16Gd045QNkCJgSziLKl0i/FCLyBE5RSW6pF0ZIP1wExkh?=
 =?us-ascii?Q?cv+DjF5eYFi/8GcGRAjekUefl+FgB58n6SV0ZBTbNuvQ6q7XZW57BLJxHvQZ?=
 =?us-ascii?Q?/oGeOy/7MAyXqovWdC21pX1HTuCzOH14f85HkJv2vAoWnjitgiaQCvoVT6C1?=
 =?us-ascii?Q?eNWsDewgHNpuhE5gdBWSWQdTuQ+A9J1qWxN5vfvObz2li7tF/0gYznQpBXyy?=
 =?us-ascii?Q?XMD+PwAmEaCQk0kxf5gmUePfDM03G6gLmEv32Q2TWcevp1xSu+aCD0L/9SnL?=
 =?us-ascii?Q?fH5dYOm95onRM+lZ2r21nC4Q?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26947436-31e6-4f0d-ae70-08d936fbded9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 10:36:05.1955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BPXqCRICFDfj33bVYWyT9FzUOTUGWu9vxVbkg7fRQqwLaHYUFjQrPR8aHNKs8DRTJ6FbwfZiWCIgI8ysY/+dd28Sbp5tbqVR3mw0C3v4buNns4rFA9EviQhp6qRZ7oCN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5386
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, June 24, 2021 2:54 PM
>=20
> Hi Shimoda-san,
>=20
> > In backporting point of view, I guess it's better to apply my fixed pat=
ch at first,
> > and then apply this DMAENGINE patch. But, what do you think?
>=20
> Yes, I agree. Could you kindly notify me when your patch is accepted
> upstream? Or CC me on your patch?

Thank you for your reply! I'll resend a patch with your email address on CC=
.

Best regards,
Yoshihiro Shimoda

