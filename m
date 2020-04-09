Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA3A1A3163
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 10:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgDII7B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 04:59:01 -0400
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:5920
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726707AbgDII7A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 04:59:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diLysHeWkTV7Cneu6zUb0kHCwUQx73RtE8enwLIbPfO3XQW+7kf8WM/T/TCHikGtggWDuz65j3KKW74bZ1WyDVAH2t+dwYQEIlictU8OBzlvsZ6eVR+aJhFW2P9uCV2fjhxpcDEZ/toD12/bT8Aq7NF62BuK8mr1fDja6oFf9JPmDK6quhS4g10LkiD/IjjQax1xpqOsdJk+hTcsdFrrt23WI27VXEC2Gu2bDi8pwyrJFMnHQfR1yarizD6vIeuoRKSSxK3y3bMWaJQQ+EahhcwL3jacqw5WEqzG7dKLfBXBBXwOuzsJlW8n15UyPXibnKBUPXAzqFybWPNVFkTVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuSl/j80HFnudn/Tbcr5KhXVHqOUfovlcJGMcjLTJXI=;
 b=OCRNjwbnYE3ZlAL5GYAARiVyT4uX+x1ZvTojkFuu4aQHe+w+mCtWlq5kbXTPWCMG0TnHogSsyNwGWkzFts9F4IKCI2HmzoL7t4F/qw/eoJzyDFtwRmPjqybCpUAI4QeWXkgscBt2kT7C4aOSpdipIpwM4ypx1BspJDC3ttwc8OEoYXsv9bqjm2cgc56nzYZyaTxB6QV0kWIaJ1AbLesp7E8c+oXkGoF3vSmXPd/zYChRXJrT3KCwP6heWfCHmZ2QcK8qkRs1zLQhLj/dgADWhMg7Wyj6JP/rRKvbS1SFL3+6bXKH/oo7Fo0JV7AKqDNNYLymq3liywTHSubkcrCVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuSl/j80HFnudn/Tbcr5KhXVHqOUfovlcJGMcjLTJXI=;
 b=ena2zM79i+WU3HOR3Jfsirj8v/4YM5I17I4pg7VGmeHejt+TYESmMu2iMziaUUl04LUJpjkm/TV0ijMH/L0o1AOdv1i0E19Nnt79a0uB86Xlucr5p+oaISdkAMPR7ZYqePei3kV90ZDOqx784euaex9nn6zkcxlsPIBG8yDHypI=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3725.jpnprd01.prod.outlook.com (20.178.138.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Thu, 9 Apr 2020 08:58:58 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2900.015; Thu, 9 Apr 2020
 08:58:58 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] mmc: renesas_sdhi: refactor calculation of best
 TAP
Thread-Topic: [PATCH v2 1/3] mmc: renesas_sdhi: refactor calculation of best
 TAP
Thread-Index: AQHWDYqjLFOfg/E2dUWrWBJ2QLsz/ahwfvdw
Date:   Thu, 9 Apr 2020 08:58:58 +0000
Message-ID: <TYAPR01MB45440A401D341427694F9419D8C10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
 <20200408094638.10375-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200408094638.10375-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 82319686-c8aa-4aff-0b10-08d7dc643d88
x-ms-traffictypediagnostic: TYAPR01MB3725:
x-microsoft-antispam-prvs: <TYAPR01MB3725E133B68F6426A72EFA8BD8C10@TYAPR01MB3725.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0368E78B5B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(478600001)(4744005)(8936002)(186003)(33656002)(81156014)(26005)(316002)(71200400001)(4326008)(66476007)(9686003)(5660300002)(64756008)(52536014)(55016002)(76116006)(110136005)(8676002)(2906002)(55236004)(66446008)(66556008)(81166007)(6506007)(7696005)(66946007)(86362001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VE/LkcIdO000WfzBcQQAaLNEKn7K+19Fl3kps7/nwrhAtUX/TzOdp8lTZi8ohMA+Qf+Aiuvnv0ZlggiVDTr5kF/enGUgC9W4u01VAPQPaZXAxPqUcNG+runIPLOgW9rfod3Sc1yBmEEjEpGz2VhIOr1godhj+B9ejnB6x0Xhx3HVO1OR6SabByAFvv7cQ92rWvVLsEzSA+2StrqHtgF3K8CcU4PgyhiSdk6EBGAOIj2+DuEcQsPepgnSys1AqMjRgwp8e27I0SqoCTiV1y6J39W4yNvFJSS7O8G45NzA3UeHhSo8SMJcNjTUBjX1fEs+r93TwEXma2OVjsio6LcvUuhUtKEZX2YLYszaAlO2Hg88Jg9PVrnZMvVd/ZzNTxr9whyIgkD0KFo58gkEYbPBnlCzJIhUfFm/2Ct/PL9UeklE7yakyWQk2giSL76BB/kh
x-ms-exchange-antispam-messagedata: j8pcVAW3+L0nZsq1v3ccDiy2o9YLIs5MqG7wtFm7by5MJstr8rVIHgaGaGLjDHwGfMz7w5pzT6A3k05uh1cul/1+MMMxkYdLATVN2Ulxq+2QWFFhy/7KYT4vIVEWH/VlNTAnqpx3pdRcgryCKTDw4w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82319686-c8aa-4aff-0b10-08d7dc643d88
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2020 08:58:58.1611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C6FJZ2HQydTAvd2WDCuigdEZNYEOx6SUSDYnqQiHrmE/+ooglpYE6epJQ9U76syRQWKgCA865IEV7lLhVUzO5De/9f/jh6i757ThPzDxOsRD0x9PGTnqbjAm+7VmFPDW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3725
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, April 8, 2020 6:47 PM
>=20
> To select the best TAP, we need to find the longest stream of set bits
> in a bit field. There is now a helper function for bitmaps which
> iterates over all region of set bits. Using it makes the code much more
> concise and easier to understand. Double so, because we need to handle
> two bitmaps in the near future. Remove a superfluous comment while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

