Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261533A9928
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 13:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhFPL2I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 07:28:08 -0400
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:48852
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231856AbhFPL2I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 07:28:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDZJGAqZ1hiui89KAjC3qz9/4c7HNBQXAE6ZHF7+aIA3EOkMmkxMDudbG1ALuu6qCwItoreufuBgopX5J2BriLx0gfI6m6fr2Q5Bdh7vpaDA/8JHhtJA+zPmknw1WrYDudWaMhq/3+JSiSaQItpMgarzh5s5xC9r1dQveF/dGikKa11AhUGVKpCD6ZoOHjvi5J2RYf9BLYipFKbkr9lgdIfGICaVU4YWrgEwjYZPIB0F3oG8sWT0ytzmBv7LqkOa4jk2lQOEdKBcJfmnOnt0V1PRYM1nnl+o4nXuWjx6aH1zYrAF2t89hoQD6TNCETf8DcmXn0X8XokObBxF8nEyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WQlKsqDwya3bopiSTXDgBzOM3jr66PVOoUlTg0Z1UA=;
 b=Qped6hq8RbuldcsKLwGfdxKbhJKQx4cTaXUFZWGZD0sP3SV0hbVOY/R8i8d5zHWVPpmwyqOQHu+XOrQhd44XC4vAYDelXpv5Gtgv8CUQXMhpqavSYXIGf1Athjendavmm9I8k1O3t+caP+Tmxwog/V8TnBRbz7Y1wZwiEwMZvJTDl3DG2gUCPEntX30HVs4TbPaYYNI002+xCivDjCXs6wRIdit0zs4F50GEdRU4rUqUVt06k9rWYxFXGPlMrFS1AF/cpDAYjUVC3EIKzoIfz4zswQh6sDfkC1QgqUnVQiPbqU6uuc2O0UtLuSdQ0+bpAPqd3lzvs+rd3Y8WkVPofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WQlKsqDwya3bopiSTXDgBzOM3jr66PVOoUlTg0Z1UA=;
 b=fkmBn5wbz4iqCTxwiYv0vcTj67CqfL3xATaN+BuSEX62p9LqPqEuOm8siJfImLq/in5TTO8QGG92ZLrNGA0LNDnhio+ddTvXuHocdh4UOcJASsZj7th9laTiHSXqCuW6KJ8cHFeq8eyru49YFaby++yqckyAqM55xoYwwglJPPo=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5279.jpnprd01.prod.outlook.com (2603:1096:404:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 16 Jun
 2021 11:26:00 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.025; Wed, 16 Jun 2021
 11:26:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH/RFC 13/14] arm64: dts: renesas: r8a779m1: Add Cortex-A57 2
 GHz opp
Thread-Topic: [PATCH/RFC 13/14] arm64: dts: renesas: r8a779m1: Add Cortex-A57
 2 GHz opp
Thread-Index: AQHXXdxGNIZMI3Q/qk6wz+Ypq32vkKsWh+3g
Date:   Wed, 16 Jun 2021 11:25:59 +0000
Message-ID: <TY2PR01MB3692F3E2FC27F2660DA5525BD80F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <b190603bffa0bcc4e66a441fba04132635de3f0c.1623315732.git.geert+renesas@glider.be>
In-Reply-To: <b190603bffa0bcc4e66a441fba04132635de3f0c.1623315732.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:81de:11c4:e195:fc55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 386288c8-aaf9-488e-1a6a-08d930b9849a
x-ms-traffictypediagnostic: TYAPR01MB5279:
x-microsoft-antispam-prvs: <TYAPR01MB527959FD16C171504760675ED80F9@TYAPR01MB5279.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4CLbLvPvRWII4ehPuZwEx5a24jLmlptEcUlK2rcOGLXqQZA5x7ewexZ1SDTq9igrnqpsljseleAbWAApl0WspJQQ5/AnwebcwQz3Yo4OGPxX434NXAttIcjqb867QBe68iEAqWmyLZv3H5D3eXUkY79YZ8OWoo8vUZwPzZR60G0Iiq6yeUIO8VLNZWV7Bc8B8pJZreFdhG4sy/Ugi7J0TIu3jfoK7goIKMrCI26Jl+JQ2ze3hVBL+IjHo/Wiu8po7HfSyCJLk8weBNK2NraeF4GE+W1pTAZAQQsmuX9pgJfaCV2tF5j0aV7tfUQ+/DY33xCwnBv6qkgRAPXsv1TkqRGyujYIGKfxYGJWWU/sdRBFT/22tG4KzF6TSLSB9JRpB89wmkc8p2CCiSIYencrtvloetem0bMw8uCbj88sfDqaKN3Po6/W4dUt2RyyrMkgNYGgllcQvixh72vkim/LPGvl3H9iGLzraxgWrKG9swt8PVQOr+ek2uU7s4hGFnmx4oC6MncZcQUNpWsIQqL47ZNoP0bz2Ycfy4zJ3W0mnVkTbYDXF8XxE/sA0+J0pip+dU5f4LmzdhHr1tkYEvJiT4QuFpuJsUnmEmuw9s0+Hlw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(478600001)(52536014)(122000001)(5660300002)(2906002)(66946007)(7696005)(4326008)(76116006)(33656002)(55016002)(8936002)(8676002)(64756008)(66476007)(66556008)(66446008)(186003)(9686003)(316002)(38100700002)(6506007)(71200400001)(83380400001)(86362001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1kwhVF7gcKMYETD/bPrj8Uk3IfJhnvebutqMiZH0YUcNNgciQTNn6FGe4jfJ?=
 =?us-ascii?Q?XBUA8okNlncz4I6+RQeIrZTePLTQDkd3IZUo5lE2IP+dzPT49a7da6Q3rHmU?=
 =?us-ascii?Q?UtoBszrIM7wXUnIEqezIsT8zPLDlVuJEH04ob2gafoMCY3vSMnwDxlsQTFww?=
 =?us-ascii?Q?OuOaxxytu7jXutNx6IaqpENZDzPSyQEE5ChQgmoLxk0L6k0aGZ17PyXp8O2F?=
 =?us-ascii?Q?oyKen23+ML108CfEnEyw/Bz+Fv+Wp1Seurim9C+2gs8kt8JPr6gtGoMXukUe?=
 =?us-ascii?Q?wSoojch3UJlYWw3x39nZUKDbZy4rQUah1+fOQN07MqI/BQiCTKeLb9mBVMq8?=
 =?us-ascii?Q?yiFjU+7cGb2BAG0aOmC9xTVh+NTFjzyLlV6kbu423HBWJX49/l7hBktmCbIC?=
 =?us-ascii?Q?blxNh2j2Gfie/fq/gIQ6NaHu+fID+2L3T8BmEW0pMnvgAU3CRsrwIA5j6Yb7?=
 =?us-ascii?Q?xCI0/5v56rY74jdE3x7+9kXlUtzWOqWC/HBpGU/OyueBGKXfj1eitDrXvL+p?=
 =?us-ascii?Q?1mr3N1P4xIzGxPDcy2ZDdWKFoaK9ianeiETRmPBtL6i+TDudt04Ti0OpYQBr?=
 =?us-ascii?Q?jKivoksj014vZvoD/MWGVdSkloYVU35JLsIaQEVIdsmsdZaTYPEqS4X7+67E?=
 =?us-ascii?Q?vdkitjjMlxPcf46oZcCpOy5MrT9jerw6291umOvX8Nm83VnaTYVZVm0c963l?=
 =?us-ascii?Q?V6aW+bPYztN4EH9/8rvD2WEaL6dq7kWQ2+RLzY+PzVEMR1ZmgAk/PdVrehvT?=
 =?us-ascii?Q?cOBY07PlepoqMUwOuY/sGLyQvWwCWydBUfRsFGN6/WMl7ADL/HRvUsWYjPLZ?=
 =?us-ascii?Q?nssc35YdW/Dqteg/HIToqCtO6gh3l2Qhojwpt5pgPsG5pTdGCnuYK9vpJN1E?=
 =?us-ascii?Q?TgoaOpabF9s/bYijVRh/kca2qqUlJfxIKW+K8Uoj5txLt18gmi4kAwRpa581?=
 =?us-ascii?Q?ahgofX60H6T/D+eCfTCVS+ndQgTnpJQJbOO4OL7IXEaExv6cIddovAWiZxJB?=
 =?us-ascii?Q?cK1gNBSmpGeTxwYA1kZ6hGtUxNq0isoZ7FVGRo5XEPjYQWxYrZa0AcFzngY5?=
 =?us-ascii?Q?wwqQZlEIK/4v93bpuCRoD+RIuMERXr7x+XhdE9qvcjF8X62tVdQjEoNraJKl?=
 =?us-ascii?Q?ZLP+JJmaSK6fYVpWGuUOKI2dJSVkR6xNf1VMuT9JIKVl29AsBn2KUQFiAs1V?=
 =?us-ascii?Q?i/4CN+zRCfxynMmtsdKn1q1SDshUCD2HRmwK8hWZpaXCC0dENblgQu1yfbY1?=
 =?us-ascii?Q?NgtmSBHJYIr4+tMxuLiD8R7gNPHTKi9gkREGZ8tAQDynP4PlO0st3UfGuT9i?=
 =?us-ascii?Q?QSoIhjzD3Z05id6pe1RFl/hGL1Oji8LPKmU6XvNW0kFkLKst4IXv2xriy0qm?=
 =?us-ascii?Q?e2gv2KI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386288c8-aaf9-488e-1a6a-08d930b9849a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 11:25:59.8732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gDW297Nd0KsMm3gIM/+g62i5FmfsClfVDpDeopxum2eKYGoV6xTgvkhyWw1dDN0lj6dKMJx2Pb2VuxjRoVuHRS4H0US+FROfM3RQGdfAIGN8+XeakfIfMLuY76TrlGjz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5279
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for the patch!

> From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 6:37 PM
>=20
> Add a preliminary operating point for running the Cortex-A57 CPU cores
> on R-Car H3e-2G at 2 GHz.
>=20
> The opp-microvolt value depends on a future update of the Electrical
> Characteristics for R-Car H3e-2G.

Yes, we have to confirm the official document in the future, but...

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a779m1.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779m1.dtsi
> index 0e9b04469b83c661..01b4e787e5749219 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779m1.dtsi
> @@ -10,3 +10,12 @@
>  / {
>  	compatible =3D "renesas,r8a779m1", "renesas,r8a7795";
>  };
> +
> +&cluster0_opp {
> +	opp-2000000000 {
> +		opp-hz =3D /bits/ 64 <2000000000>;
> +		opp-microvolt =3D <1020000>;	// FIXME TBC

I heard this voltage is the same as 1.7GHz's one (0.96V).

Best regards,
Yoshihiro Shimoda

> +		clock-latency-ns =3D <300000>;
> +		turbo-mode;
> +	};
> +};
> --
> 2.25.1

