Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443832573A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 08:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgHaGXE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 02:23:04 -0400
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:47760
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725835AbgHaGW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 02:22:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG+y5p7aepHFcHhwHTTnh1K0KiZdc98CqsK2x+onkiu46EiKu1QKSTtBSeYNxohoCw+IZYBAFTHAtAhRSlut9LpE5tL/Stb9RHKJ+aXwMNFT1SAMmaP5lMePDusJnZ+8mDTHfv/Sg599qYkMML0c3cNhINzyq+TscmQmougYCu6yX/wCPE//Xy7F8Q4eHpquwpsD/XYQUhb4vWJIvuUgVu+tU0c8QANdAHYPhWrDokbb0eF/uOogSAO7zIfkgASPz0sNUdIZCpBFgdsE/KjrQ7XL6lptCm+0OldYPD2jIpqA1MjP4bHiidRqVk0HtR0QAczT2v7l2+gMN7itLVLtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1QeILV1dnNm7tUm+Zfl+l0K2mNHtLiQ9IgI55USnA8=;
 b=DjM0WMER4oH9C/o0dJjst9ab3K8J6Diqij2U3pl6PyC6HeP719ncnfkH24+WY1XepRJ53ZkkQGF3Swh4eHkjn14mlM03YfWMeKM69M4HMbPgKTlE+dLS4SGpuGV0iiu1nK/QqiA5tUOgj8esE6pk1rSjInk95hmTiUbN/e7FzMa9o79OK5eM8MzcYDR7/NK9M8jTpHYrR8P2/7z24+Mg2PiQCtqrtziw9lNFXOm4pDyn2JvKgPHY9SlCqYXbzCK+NQ5NObrsKTvlg17nngz15eZrYvIoE9NDOBpb1Wy4e9xad7kJV5y0WyN6XeCzp7UHTVkU4CZGt9UD7FmCJOv8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1QeILV1dnNm7tUm+Zfl+l0K2mNHtLiQ9IgI55USnA8=;
 b=B0LXdmIOsjOVSgeCPhAxeS69u6RnKIClKAC6MHIQ+PbYizW5p2+sa9T+qH4/vTaUOk1xRAykMGkcs57OfOB0ImOGzlKpmbzjkayD30xCa04ePB+zYGn9yoraCrQa5/ndn65krhxgrp7hrIzo1BgWY0HNiUhYhrSFg+xt8P7I55I=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3935.jpnprd01.prod.outlook.com (2603:1096:404:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Mon, 31 Aug
 2020 06:22:56 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 06:22:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: support manual calibration
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: support manual calibration
Thread-Index: AQHWOyHXDJ9Nxdhj2Uux3nDBdkC+TalSQ+Ng
Date:   Mon, 31 Aug 2020 06:22:55 +0000
Message-ID: <TY2PR01MB369224E06BAE72C1711B681AD8510@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200605101222.10783-1-wsa+renesas@sang-engineering.com>
 <20200605101222.10783-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200605101222.10783-3-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:cdc5:a58d:f30f:99c5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9c3ef85a-b9fb-4632-d62b-08d84d764ca4
x-ms-traffictypediagnostic: TYAPR01MB3935:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB39351585922D6CBD91D0194ED8510@TYAPR01MB3935.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AIKhnrYUKskCpQ3DmvUrvaTQG3Hm9ALXIzZg2t9I3mJVIYL8E29ACuFuFDBmVGk/aGNzodUEEGIYho+X2mWRfI8c2iGsO1sU6owh9qxHMbo/Ta22acyjWFU6G3zErh0XRfq/vUCcBRnLzD40OgYxAw6KxbL1/goP57I3GOC5GgRUbVl7Q24QMOLfX+Il8WRBoQX93w6r1zlgO0hY/QmynVHCGMiFQe0PsfLIkGZZm54LabFgIdWbfyv8WgJK5ldAaZmF2179xuvy+8RQYmDi4jVgAYSocIhiBHZ64a/O7KzUhMmFOs2LoAcFHZ0naPR90pUrftL6xhObVUeoJ94yjQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(83380400001)(66556008)(186003)(7696005)(107886003)(6506007)(66476007)(316002)(64756008)(66446008)(66946007)(52536014)(76116006)(86362001)(71200400001)(4326008)(54906003)(110136005)(55016002)(9686003)(8676002)(33656002)(8936002)(478600001)(5660300002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: MM9XWpEIDqU3UHrmRABGPvid1l8m9/S2jMIs8vBbt19too+06xUO/bfEW58QEdupsYlCyWFc/S1OtGxtlMaLZnET64IcAzURM+A7WDCw2EIChlOPB/lwvg5oOo9GWp9rlvd8evEvuPh8M4x5+y5UJFRz19tLwshwxABiCQ+JojBCBVkw9qzRdUp8PPBk+JzEkKEzyNRKZBMEfYuLTZ/ud6VN6ofRN4RW17VHUna+Sfws7Bs4cRmZUiow7w+cmtBsClz6uYcO+D76a8FxGyl/F2LKptJGikXbt54nzu6c58joH07ua3Ic2YMT2PLF0dd7f1k65SzzDw1h+rTwK31LBWTDWAl/Nw/azeLnXIEPcmv7kgummRIkgJKiFxjXlZ7NVA1aIQX7gefZv/56UlW56CIl7Vc7OMppwby3qVemEEsyU1BQ5Rt578dq+b5OtX8JRGTg87Djby0eI2kcQNRxYCW7DRrsaq+EPwz81sTcf5O20JELhEQPKzXAemiTZFm21pf4vPwxXx5EDI0s1WnrIHvNiRaXCye2/Z7EwBD34vOwia2EQy5KqjEo4oDh9fA2Of2l/4Z3/UtoMnrm+5BDWUx8/y88knmDAIpUQj/r3fZ2tYAX3WpQmfVMbyccFv4jrrW0dXreBxtLGWysrqeB8rJyZHsUmHxK52uRSW6+g9YjUtf+P8Wzmcs7sF1dIj1vszp99VKEQbWxF1lwwWE/TA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3ef85a-b9fb-4632-d62b-08d84d764ca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 06:22:55.9306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJMVMBC8EXVr/ptOF8VUFynmgA07X1vemQVLNnnfsF+HzJO9k5Z61GSQrbhHOGjMnneZ8XIyvGVkbfw7/b7nyohGcOJx3tTPDqVXBS8cNt/hvWNVCjU7e0lniBunRVH4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3935
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!
 (And, I'm sorry for the delayed response.)

> From: Wolfram Sang, Sent: Friday, June 5, 2020 7:12 PM
>=20
> Some R-Car Gen3 SoCs need some manual correction of timing parameters
> after the automatic tuning has finished but before next CMD13 is
> completed. This patch implements that by this state machine:
>=20
> - introducing a per-SoC correction table if needed
> - iff such a table exists, the 'fixup_request' callback is populated
>   during probe
> - iff such a table exists, a runtime flag ('needs_adjust_hs400')
>   is set when HS400 tuning gets prepared

We should set the needs_adjust_hs400 when HS400EN=3D1 is set.
In other words, we should set it in renesas_sdhi_hs400_complete(),
not renesas_sdhi_prepare_hs400_tuning().
=09
> - if tuning HS400 fails, the runtime flag is cleared again
> - the callback will check the runtime flag and enable the corrected
>   manual mode if the flag is set and CMD13 is encountered
> - at the end of the enablement the runtime flag is cleared
> - iff the configuration flag is set, the manual mode will be disabled
>   when HS400 gets downgraded
>=20
> There also some helper functions added to access the TMPPORT registers.
> The actual correction table is SoC and instance(!) specific and is
> added to the quirks struct.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
<snip>
> +static void renesas_sdhi_adjust_hs400_mode_enable(struct tmio_mmc_host *=
host)
> +{
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	u32 calib_code;
> +
> +	/* disable write protect */
> +	sd_scc_tmpport_write32(host, priv, 0x00,
> +			       SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE);
> +	/* read calibration code and adjust */
> +	calib_code =3D sd_scc_tmpport_read32(host, priv, 0x26);

When we read the calib_code at room temperature, the value will be around 0=
x10.
However, we will get 0x00 here. So, we need to fix it.

Best regards,
Yoshihiro Shimoda

