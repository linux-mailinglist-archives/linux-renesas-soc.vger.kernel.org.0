Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F71A3505
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 12:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3Kh7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 06:37:59 -0400
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:36592
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727726AbfH3Kh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 06:37:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myo/XAN0nzcSOft3yEQ1TLdXsICt2uxGOzX61FFy0dMphdEWk3Z2x7bjvRY0jsfv1KQecJd6x3WQj8n9J8tnCsz2BAohz4Rl/fliKrOy8s6luZ9K0S0X/VPVhS9yhVirGJCzgJwZvUc3XgTHEf1Ogz0+QF80TXDWRpCFrcqFjSXt2vl/kBbxLpH/Yxjtz77WmCJDBwV3IV+5urT1m5/TkyGn7qi9psWDXCoUYt17t0ymfFVi+F8NNNwFuPGUd+tslRPhgxI7Ck2wkmoevhIG91DwigpUXLGajHPe6trM1LFpPyrf3k5zBu/HQhyTNP0r80XVoSXzeAzb74tl3gzcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UeBxHP/Jn+1pGzEJc71uz1hEs4LNCdeqaXsoUKqmFg=;
 b=drK74o6Ok0Q7GPJS/yAmMitnacleT9SfhbCmpw1ZLr141CvL90NoBm9YOXXG0qRNN2nBckw/FUMnUsGIGk9ClgwtoRM2HJMR+PArfdMIM2CQ6HYqHzIjL9w+yM2KqACteCLFE8t3Sd0toWKZS+LXwMKYfBvJUsp3pP4DY6NlnllJPiLoyVA1JnRyz8JzAoQU3XE0gd5YiCVzGy4EmTmxy0bbbM9Mm/6DGG+j4PEGB3NFhpMtJ+Axc6qhNB2qjeTTVzvyOpJNkkNcJjjk8EKu4NDKA04U4+Qx9wU0lGi89K+qzdMv7ZvbYKLL3RmfX1JgUD73m+BPhceiXEjdc9UaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UeBxHP/Jn+1pGzEJc71uz1hEs4LNCdeqaXsoUKqmFg=;
 b=WdPO6sRdPT1tveliNY/5v+cR+wKGDlKVKfRL24HWyG16JAcm/rNMVltKpc4v3iR61b7ukndrjY5KqSxsCXQKExMucyNk36XdHEtMfSWp2oHGGdmPiYti0A6O9pkR/XwNd6hL/pxqN5XOpQatXpT6fmdrHs8rzATo/oizLj0r2ug=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1707.jpnprd01.prod.outlook.com (52.133.163.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 10:37:54 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 10:37:54 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1
 bindings
Thread-Topic: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1
 bindings
Thread-Index: AQHVIFaYoM1lViMuq0+eFn8a/8KA9acT/OeQ
Date:   Fri, 30 Aug 2019 10:37:54 +0000
Message-ID: <TY1PR01MB1770BF952221F50BBCDF3765C0BD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc93960c-5c66-46de-67ec-08d72d361d8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1707;
x-ms-traffictypediagnostic: TY1PR01MB1707:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1707D0A3BB30FE5FA77C4F8DC0BD0@TY1PR01MB1707.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(199004)(189003)(256004)(8676002)(478600001)(413944005)(81166006)(81156014)(52536014)(5660300002)(486006)(229853002)(3846002)(86362001)(66476007)(6116002)(66066001)(66946007)(71200400001)(64756008)(71190400001)(66446008)(76116006)(54906003)(66556008)(44832011)(53546011)(6246003)(6506007)(25786009)(110136005)(446003)(186003)(74316002)(76176011)(316002)(305945005)(2906002)(53936002)(9686003)(8936002)(55016002)(4326008)(7736002)(26005)(33656002)(102836004)(11346002)(7696005)(14454004)(476003)(6436002)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1707;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 64sQkXBpsec2K889bUjnI9vLkevCvHjqs/gAzIbT7okKZtIo/4BgrOP8prSIdgwuYgfUAv+AWC1m2wiDOoY6I/8460uuXwQt9fFkAJpCmxk+L+MrYA/1HLzALaJZ2WHlX1WhAq1nFOHYT4U7D9L7hmg2XY56Yn2ShjHApW9PaXQntZWruWGsT+/ItZfLnINEFQizl3V3r2vOj8cC5jJZxMPCNIazmaolflOJx/jZ16PIuUeaH/52fath66cRgL4BMiicarOKxI5r1W7Aiil/CB3lFEJYEJYxr2StP9D3IEs3Y+XtsELIwKr8ZRt4OaNZMlhxYDEWg4eCtHlViuRbRAnsbnc6mPh5rysk2vSbcyaHyf2Iv4XEFkV27AFldELh+44qFDALW4dWXPZkLdBISWey8+wM3R6NLwD+rWUaE0Y=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc93960c-5c66-46de-67ec-08d72d361d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 10:37:54.2656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NKj1kuUURnWNgUKo6iJ3K6TH7MxTLNtXThn2mIWhjQYhtLU3GzGmrXE4xztPo5P79JSpsncjlVQR6fLSv0iz+Zqyhw8ve08j3rpDl1zVMAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1707
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dear All,

This patch has been reviewed by Geert, Simon, and Rob, so I think it's ok t=
o apply.
Is anybody willing to take this patch?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 11 June 2019 14:07
> Subject: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1 =
bindings
>=20
> Document RZ/G2M (R8A774A1) SoC in the Renesas TMU bindings.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Do=
cumentation/devicetree/bindings/timer/renesas,tmu.txt
> index 13ad074..9dff7e5 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> @@ -10,6 +10,7 @@ Required Properties:
>=20
>    - compatible: must contain one or more of the following:
>      - "renesas,tmu-r8a7740" for the r8a7740 TMU
> +    - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
>      - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
>      - "renesas,tmu-r8a7778" for the r8a7778 TMU
>      - "renesas,tmu-r8a7779" for the r8a7779 TMU
> --
> 2.7.4

