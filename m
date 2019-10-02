Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B86EC46BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 06:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbfJBEtw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 00:49:52 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:8832
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725942AbfJBEtw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 00:49:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FR4DzehtpeLFnsq0ABsPAAwxNb8D3C4XJ8VXDcLkrRM9IehjUpL4rRCySOdQVLYtEeop6K6uQ+uL9XPlvqIJQS+ReAdW/COcw4bniq1jQovgvIaOGPuM5HFNOnLAEG9NosJzsRGv3XXQUcWaEaVl/jv8YretyU3M0o6Z12lGIpxHMLCdhg2IZgxQpFHQSPQnIn3wgNlx2op/BdfOPJSQZbgFza//+APN8d7miqtiTMmIZSdD0sCLDHut3u0FUlWsYsQXrSofMRLHMnF3UV9bls27OjYY5UdJor6Xyccss9Ty346T5/J29u5U/j+2Ul5lhI9Xv9xvvT9klPEwffMCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDVuR+Uh1OBcsP9VhdrNMw3WTMmNazsSYBWy2F2mkJU=;
 b=mXUVx+rAO0E2xKovNF61SzL7hoDzxec0/Lfkdi/ytBmOETL+PzxSnIcFefsDg4dXnTLIqyMWm/9jX0/fy9sAzp8ahD1leAs/wZ65KVjUslbfXde01B0sONDL10vIAUuRzvKSsYhdDiq/X27cghGHYBfFpGcJcLetnh0xRNV2MfhdO3F1BKYigla+BsNYMs3xasgK21VmnS0TYHwswtSAsWWXb2Wr5BbmMdC4O1blfyyP3SG326UVT8reFvLYfL5h7PR06L6BM49xfsFbn2/JUvcg/KWV8dWcwqTXPMKrEIloKi/0ZVhzB72RgCe4uMKYwka+7h26iBmCmrSsFRqy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDVuR+Uh1OBcsP9VhdrNMw3WTMmNazsSYBWy2F2mkJU=;
 b=QRAphZEbjJTv3nFtbcclFFJPxm5aQamJPlzkfYIg8WEmzZSiatXjRx1G6SJsljYeJQV+VcHwchraQ8cyk8y4F0BWWmO7YLjntfbTGAZzmeCzK88WMcN7LfjI6zikCUfwLn9UuU8k/aZOt5rl8K4CJpxzqAnqZITTJSkjPd3ujkM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4880.jpnprd01.prod.outlook.com (20.179.186.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 04:49:49 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 04:49:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] serial: sh-sci: Use platform_get_irq_optional() for
 optional interrupts
Thread-Topic: [PATCH] serial: sh-sci: Use platform_get_irq_optional() for
 optional interrupts
Thread-Index: AQHVeIMkdwKo+H/0xE+Vfe/hv+PSGKdGxrLg
Date:   Wed, 2 Oct 2019 04:49:48 +0000
Message-ID: <TYAPR01MB4544E8D4235AA2DF1D81BEC3D89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001180743.1041-1-geert+renesas@glider.be>
In-Reply-To: <20191001180743.1041-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3642aba5-ad9c-45fc-d8a3-08d746f3f4a2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4880:
x-microsoft-antispam-prvs: <TYAPR01MB488005AD009571F4828CFD32D89C0@TYAPR01MB4880.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(199004)(189003)(14454004)(229853002)(81156014)(476003)(86362001)(76176011)(8936002)(7696005)(8676002)(2906002)(186003)(66066001)(486006)(6506007)(33656002)(102836004)(6246003)(26005)(256004)(11346002)(99286004)(446003)(6436002)(305945005)(54906003)(52536014)(9686003)(4744005)(5660300002)(74316002)(55016002)(7736002)(6116002)(71190400001)(81166006)(71200400001)(66946007)(66556008)(25786009)(64756008)(66476007)(66446008)(498600001)(4326008)(110136005)(3846002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4880;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: teJFFtdT0CpOWjduRkYmSnMSiveobh5Z6Tw1ZLyQnvNvbZZ3ADJSfykEurpLFo80lVGw7uTBOXZTHCfKaNMgXkTZsi/KiMRaJS0fx3c/wbyu4EC8I1HcgCymLczFG6G4HyDmWBD09aerBFeM0NzArhhP5jQcdO1iULcb/SxQiFUPWp6/EcXkiolgWEdpRUNoBtoKLaG8063SNK5WyglFEZHS7BHbjS63Z+JMHNAzfnE7UxHUiDd59e+lNBRRh08308zUwr4kS+x3EkbbmSj4opKO5YaGyNVSIPMyzxj5QRT7aC3tc65E+aF8HPop75UK4Ey9qZvp9W3Btt3BdeBSmPQXyI+zpFGYrV1jDbv8+uU0NRcHZ5LXnErxiLG7K6QtVjfiR7pSI75WVSjpzlKvaUQ4F3EOg2xGDdssJz4y2Io=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3642aba5-ad9c-45fc-d8a3-08d746f3f4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 04:49:48.9635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMMUCzUokQEOkRts2FV2oD7Kt2KnwEFrmyV/mWydjLJWXUZD2/ZLsz/l1udBdYHwcjIGrMVvqAouWpLyu+Qo2eT1wg2XMKl4yh3kcIdsZhXpZNanvu0ZT33szzvR3z9i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4880
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 2, 2019 3:08 AM
>=20
> As platform_get_irq() now prints an error when the interrupt does not
> exist, scary warnings may be printed for optional interrupts:
>=20
>     sh-sci e6550000.serial: IRQ index 1 not found
>     sh-sci e6550000.serial: IRQ index 2 not found
>     sh-sci e6550000.serial: IRQ index 3 not found
>     sh-sci e6550000.serial: IRQ index 4 not found
>     sh-sci e6550000.serial: IRQ index 5 not found
>=20
> Fix this by calling platform_get_irq_optional() instead for all but the
> first interrupts, which are optional.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a fix for v5.4-rc1.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on R-Car H3. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

