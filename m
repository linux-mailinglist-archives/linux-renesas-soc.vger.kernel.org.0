Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 068C5C4B1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 12:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfJBKKq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 06:10:46 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:2384
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727409AbfJBKKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 06:10:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKyDeUkfsVVNlwix0oBzbJZLGtkuPbRMUtN5QTNkehGfrX7WmniWMjM39WIHUdEqAv7yRcviEDzjxamgYQZ4rUKxjvstLY32gSmT03A9/foUPFvKKhV+u6llRQP+4WVqIwdiM0YqLllG95fwdNfWVEjd/bz9VV8lKWqjUFDjE1ql/bVNJ0kjL/19SpTr7hu/rAL8tBsg0PnmX5dlhLchte7kHwEmoNUxltf6EhjleiesqC2j1ltlzLdZrQ137d+m6GpDSj7J7sp/5dHsPPzh2yai4za48CxuPoW/hS05/GZjpZ2x1QNQAz8AX4i2Q6Af+kmS8AxiqG7uqmfTALKnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJly2kPKJyCZLZOY+vmn6JfJkQo+P9IbQ/7qjTOV+Cg=;
 b=bWN4C85gnc/80q5DRsUwaLhG2WjzsQfeIxFnfupzNUPr54Qcs9Zc70IhO0N59iGtQZ9N8mBS+NP/lxyMw7dfbZ/MCvNoSD1uVoQYLSkAU/6KFqM0Oo5S2YFrVstKOohcLSi1P2r4LslFy2xi090TM+SgJTp8wY9eB3d92dG/89vWOSvh/2+lJlFLvNIA55P60Nyn2edLw7/BzaF0dBoexPacDMbXRIDrgiQdfWAygCgr5QSpQLqK+DClWxd3xOwPvK1a1698gAw8VPE1/UmhJB+3oDaHLa8E7zndgmKUdfD83TwtN+RDWAqdV8/6WnlynSX01LaVJvOcEiaUAwGuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJly2kPKJyCZLZOY+vmn6JfJkQo+P9IbQ/7qjTOV+Cg=;
 b=NCoHJIlF64nqrqGY2UcGGblZL2amFYNUfqehwP5iumIeAwTguSiPpCJfRNH6SWe+KpFOZxkgAF3Ok3CsAFTYZId03L0ZgtWHU21zzXWHIIGaHMkTor0cZUMDaXDHbSM0qu1TkRKo/Y8Fu085JOHPlw+jw/OTyx+w+Ox1rOv4Od4=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1706.jpnprd01.prod.outlook.com (52.133.160.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 10:10:41 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::55fe:d020:cc51:95c4]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::55fe:d020:cc51:95c4%7]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 10:10:41 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH v2 9/9] arm64: dts: renesas: Add support for Advantech
 idk-1110wr LVDS panel
Thread-Topic: [PATCH v2 9/9] arm64: dts: renesas: Add support for Advantech
 idk-1110wr LVDS panel
Thread-Index: AQHVeQl2rK2U8FPfJkCXO3iV0jzGn6dHIQrA
Date:   Wed, 2 Oct 2019 10:10:41 +0000
Message-ID: <TY1PR01MB17704CC2AEF52966DDB89D97C09C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
 <1570010906-47486-10-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570010906-47486-10-git-send-email-biju.das@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 987a85f4-3b7d-4734-2c52-08d74720c801
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TY1PR01MB1706:|TY1PR01MB1706:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1706781FE7824300E670D5F7C09C0@TY1PR01MB1706.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(189003)(199004)(66446008)(66476007)(64756008)(66556008)(66946007)(5660300002)(305945005)(66066001)(4326008)(7736002)(7696005)(229853002)(52536014)(86362001)(9686003)(76116006)(74316002)(33656002)(55016002)(99286004)(6436002)(71200400001)(25786009)(71190400001)(14454004)(107886003)(186003)(478600001)(6116002)(3846002)(2906002)(26005)(53546011)(6506007)(44832011)(476003)(81166006)(8676002)(81156014)(8936002)(256004)(446003)(11346002)(486006)(54906003)(110136005)(76176011)(6246003)(316002)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1706;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uyCwnDK35pKGQkOPxu0B1t1NOji4jw9aJX3Y7R2aC9JZucWMzP2auhOI9D3Mk7iWREF8xGsjwhWokWyQrg49fY1ZhQTteGCBtmNaOMuPaoxBmHYxCU8sFdmtYjN0eAvtOVsZTIUdcWjIN8erl9G3l97D6IgsLS1WJ49BWNk8UUUX4h6WDBEuCPzOswDXTCCt6PG0uY96nMl6essdnLT+u9iGMJQDV1bq36QUYSWyhLXIu75UwT49nPCCJcYAlljeNMfuAv3Fuh+kwlyQLQQ/cH8qdQE+HBddP+Rtc4zHqNFZloRwVpisldWD7uKy3vJYxb+TeIXXC9pqmhMCgixITpLrWk8Qu0GR9dAcSUC9ancO4Vxr+K/2fN7II6sz+23StaFshLcoz5fD1dlvLwl9eE+7D7E36gjuZxPVPtghnSs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987a85f4-3b7d-4734-2c52-08d74720c801
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 10:10:41.4651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPcl34/0OBeF7EFhMBrqEgRC72bNaxoRl3erJzPyE7WW4spDDnOsyxu2INCkMnLoiEsZZeOTrWWHG7Al4fYcPXZf9a0fmN8bp1xMRrZECK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1706
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Biju Das <biju.das@bp.renesas.com>
> Sent: 02 October 2019 11:08
> Subject: [PATCH v2 9/9] arm64: dts: renesas: Add support for Advantech id=
k-1110wr LVDS panel
>=20
> This patch adds support for Advantech idk-1110wr LVDS panel.
> The HiHope RZ/G2[MN] is advertised as compatible with panel
> idk-1110wr from Advantech, however the panel isn't sold alongside
> the board.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  V1-->V2
>    * Incorporated Laurent's review comments
> ---
>  .../renesas/rzg2-advantech-idk-1110wr-panel.dtsi   | 42 ++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr=
-panel.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.=
dtsi b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-
> 1110wr-panel.dtsi
> new file mode 100644
> index 0000000..4f876df
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Advantech idk-1110wr LVDS panel connected
> + * to RZ/G2 boards
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +/ {
> +
> +	panel-lvds {
> +		compatible =3D "advantech,idk-1110wr", "panel-lvds";
> +
> +		width-mm =3D <223>;
> +		height-mm =3D <125>;
> +
> +		data-mapping =3D "jeida-24";
> +
> +		panel-timing {
> +			/* 1024x600 @60Hz */
> +			clock-frequency =3D <51200000>;
> +			hactive =3D <1024>;
> +			vactive =3D <600>;
> +			hsync-len =3D <240>;
> +			hfront-porch =3D <40>;
> +			hback-porch =3D <40>;
> +			vfront-porch =3D <15>;
> +			vback-porch =3D <10>;
> +			vsync-len =3D <10>;
> +		};
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint =3D <&lvds_connector>;
> +			};
> +		};
> +	};
> +};
> +
> +&lvds_connector {
> +	remote-endpoint =3D <&panel_in>;
> +};
> --
> 2.7.4

