Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCBA3A2193
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 02:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhFJAqS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 20:46:18 -0400
Received: from mail-eopbgr1320113.outbound.protection.outlook.com ([40.107.132.113]:30197
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230043AbhFJAqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 20:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErOxLISaelBqAwnPyQ8YjfFxDfaBqTPuaeIDlWL5jz2+Apt/laIQj7GgF8rjtQocvrGCPznXqEDKCLse7fhTi2CMzUAvDj+QqK7MYuFcdsyWDyQmE8pcIdcxYRvVlqYK+AVvgz3MMSCNdepIpVCF+hxjk4v42zmrry0lxcHvEttow6zjURTgBlUU4IOa9DoyAPAp/lhVuW6Qjv22kgjSPigHgMK1mVj6wjCOokk5Z9rWbW+WIXSex5mTBb7ipbO57/bw5fUTycX+fGtsqs+nt5EwTLu1GOLSd5yp9yxRV0OCIIMb6Y6T2inmxa/wbCKGzO0+XekDC/Dgbs5gmvOniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJEDq9wpgAHiqOy0KSB3ChIO4PTkZ9uSwRRtX6tert0=;
 b=irGwcDH/cqIA+N5/ajSnK99PEQfI0T5aexJ8eNDZs0Akj2SMXoAJ31gQ9kiKJclugQi/lAqsX13jHVCCMPpUbkuvzPyKKRPCEyiY1OrcDpQyVAHHqh3cIi6edWyquqSUuYjlbrLRbqBDHsCeRzssZwfa7L3v8qGOYWj6EcO3F1yi74VPryGeVGA/8gEQfxkjvekTUC1wSUeJC2RgEtyPHD0DQqlmPHA5i7L9Ge4YiYdoVmrmk6a5BZLoBSIW3tEyciVYBNvZtlE/dNzgiUNvN5UPBjEfQYMjLlUf0pD/gIpJcFLr+PD2VsDJAdch6UE+1vEUIngasDYa2GSafIqlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJEDq9wpgAHiqOy0KSB3ChIO4PTkZ9uSwRRtX6tert0=;
 b=pATBerMOEuu98YgODUPq4e9lMrWW/POUnTCmjAMf0J3o8IhHqFoQIkObMJhyLdwvY/W71aYGWpvJeko3KRjQj6BDXw/Gb6VMS9idPl7Y8YF2fBcCyUtY6Bnou2FkwffaviCLdW5xU7jhI05cUHOpscf5dOXa/L6/SEJQmqLvyRw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4713.jpnprd01.prod.outlook.com (2603:1096:404:10b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 00:44:18 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 00:44:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "jirislaby@kernel.org" <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Topic: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Index: AQHXXNGkj5DIm2K88kqd+niZLV/ShasLnrYAgADKQ0A=
Date:   Thu, 10 Jun 2021 00:44:18 +0000
Message-ID: <TY2PR01MB369269ADAD596B176EC32085D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
 <YMC1+n/w74x33bLX@kroah.com>
In-Reply-To: <YMC1+n/w74x33bLX@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:788d:25a8:6b90:faf3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dff3ff4-6bb5-41f1-08fc-08d92ba8e147
x-ms-traffictypediagnostic: TY2PR01MB4713:
x-microsoft-antispam-prvs: <TY2PR01MB4713D1DF9E263515BB4E0652D8359@TY2PR01MB4713.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: la6U9OuiCn6NWmth9Y1zb/6rjrz+2dZjNO9B09RAVu7IL6S98J1FgAPM96oUdhwle111aopHmLt2U5AE3Gggo1pWwerRjljcPSquWeNoDRYhWQXnz3p/bw6OObsOyv1Z6mBOT99fOG40PjrmkY+jqUMwA79tP9zhlf9SimdY46s66OacE5Ii61bsGAY5InRUqS+lpxzHeZa18wEXRJz5/7NdeBbhG0ij9vpAsgOpNxn61L8d8JKFHafNPBQHN9RohcJ76BiQdZDYMkRenYbZlvzDww0dhTR4CMYm1970xH1kIQe8FEGcWBg9TL5HxLC0wKs4jKs0wKefS8ICOeFo/HHoIba1B4Z+M6MbTR2vouO0ouoJGi2QL6GHZVFzSqbSTpdI0L/+eAUD9iuWiv89Qu7u/+5S7PaLlkqwEpTcPd/BMCC5vJ9UlYywHgDst3Id7AuJU446x76BSrR8UFy2gK8wZVI7vuoUXv4EnJ1d2t1T9566lAeM32pOhEci3adoyWXQv2rXUQyIVAuE5kq+zlvIdzqn34lytmveqnEcE/8cz0fBb2sK21NVR1BEODvLZc53O90IMUZ2P01V6JhNEseuxdCMklv+xfD31fTfbhc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(478600001)(8936002)(66446008)(8676002)(2906002)(66556008)(54906003)(76116006)(4744005)(64756008)(55016002)(122000001)(71200400001)(6916009)(5660300002)(52536014)(316002)(66476007)(186003)(4326008)(33656002)(7696005)(9686003)(6506007)(66946007)(86362001)(83380400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5PpdbRDQcJ1XbDPBN6T54fT6TpMNIkyjtXgKvzi3VQ96HZCfdhX/K8jYHodz?=
 =?us-ascii?Q?hN77IetPmPLuhlvCIrSUBH+Mr2WvYvTAFQ4x32pFU2DY9JC3CJT6wOwi9bnU?=
 =?us-ascii?Q?coZ/9ebg+p6g9ubnU5x5HE38Vzq9ZmopBwc/KWAiGZ56MJ1mazL/j9Nl460R?=
 =?us-ascii?Q?ryts/7Xn/u1iHogCbN3/81VMlptfDn7mk7rxUjvIJ3rA9a1x79S0G6AywcQX?=
 =?us-ascii?Q?BuRm/gtooLxHjWDRYufevRZo0H8I8tKNC32dMNhf6qgexWrS1a+64xWNfPUR?=
 =?us-ascii?Q?jtalg00GD7f1bjnhDmtDXFmZMlmURp4j+fjCw2ClEzCDTl2EozdoVcnhDpQJ?=
 =?us-ascii?Q?pF6cRKGpnddXPTQYQsKK+NgmwqJcMd7RWs3RviNGsNDkefzoBgSTAZqtIKTI?=
 =?us-ascii?Q?IGdO+tNTeUVvn7WPtvkRF7m89dtVVI2hMxyLHiLnW26Mynv70cJFSF7nmiR4?=
 =?us-ascii?Q?zz1QNkd9Wv7bhy9AOEhy618p8smaMNqPj8BmdA1dsFQLTwcVdhwdM8ZgNYjh?=
 =?us-ascii?Q?gwbvMvSjnxSJIP133Hrbts/DL73AG/YUMtwBVU7JkJYWeKxmx3UqjnM7FAhk?=
 =?us-ascii?Q?LJbMico0XelGXwD8CerGv3s52HwS2yZu+cIUs6Fpk7w8TAzHOLYjNY+HwCik?=
 =?us-ascii?Q?gojcYuaGY/jOsPzOhsEEz3pBTBNd+vSdHqv/e6tlnENpUdzkHX/PhzA7xXQ2?=
 =?us-ascii?Q?7eZV0lvSaUDvas9nuDTgM9Y3uWZWZ2hnziy9sZP0f+wIBmISyA7hsRR6RCWQ?=
 =?us-ascii?Q?/b63Rvu1X/YczOIAmhy9Zp5LYmUEIYS+CIqRb+8m4U2PsrXpmzsvx8GKN2Ou?=
 =?us-ascii?Q?Nw9qw1EyYZwV3FRZID5g3ZdSl0D3ydkXyVjZznsJcdf2gpHGhHIZzIcVL9Hq?=
 =?us-ascii?Q?RAtcpIupODT5dN9GtVknvdi/J2Oj3J7JoOrvYf3RvO2aAXy+/kgODZb7I0je?=
 =?us-ascii?Q?GBqnA6DoqXSyXGgwHMHo4aoEQpPRN+QlqKqL4PSr2mpAZ90EZRcKgf8//80e?=
 =?us-ascii?Q?mG9oAmCZHFW9i2pPopCJVMZ3fARaDr8A9SBwf1pJxfxvBgIX85TfMxZxXYaf?=
 =?us-ascii?Q?46/G4nkgDobszj8uR5Xg8u1c//9LRjlsg17JKC9HJpaWgzXcoO6GkOPdhVEE?=
 =?us-ascii?Q?1LPoBQfBbRTccC3FvkI2RsFJDk5hNvKWbE0yLkAyMXYlHkiRfuRl2pCOjljK?=
 =?us-ascii?Q?oWt8zpEEguMFrO2vsKbjvMWcNJSCL7CcQSmNW3z886c2ALoM6KihM0ccnjjz?=
 =?us-ascii?Q?r2Rp+vCnoM7M/m+ptKlWAXSz3uFsTv6RakMbmDpZBWtwATr2FKsPokjoT/1C?=
 =?us-ascii?Q?aPIGQ8diuTnS2AdG37GISEjyA+0d7OoA85W3Tj/sCM9HI5Spaji3vNhQnCcK?=
 =?us-ascii?Q?gOkwAAU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dff3ff4-6bb5-41f1-08fc-08d92ba8e147
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 00:44:18.1656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8UG2siuS7K88C8nQhJWI2px4Eh+MbcrtqhBw4TzXCRSfliwVH33Yr+G1+8kBeU20xYqC3X+jU0Fsxfhdfj1K3xPtLEfqeslWNpqNahiisQ6YXFgYGs3Cb4gwkF2FHrA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4713
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> From: Greg KH, Sent: Wednesday, June 9, 2021 9:37 PM
>=20
> On Wed, Jun 09, 2021 at 10:49:02AM +0900, Yoshihiro Shimoda wrote:
> > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > message is possible output when system enters suspend and while
> > transferring data, because clearing TIE bit in SCSCR is not able to
> > stop any dmaengine transfer.
> >
> >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> >
> > Note that this patch uses dmaengine_terminate_async() so that
> > we can apply this patch into longterm kernel v4.9.x or later.
>=20
> What should it be using instead of this?

We should be using dmaengine_terminate_all() instead of this for v4.4.x.
However, dmaengine_terminate_all() is deprecated in mainline now.

>  Don't worry about older
> kernels (you didn't cc: stable@vger.kernel.org so I guess you don't
> either), get it right here and then we can deal with backports later.

I got it.

Best regards,
Yoshihiro Shimoda

