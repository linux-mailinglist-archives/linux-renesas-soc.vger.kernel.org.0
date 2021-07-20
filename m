Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E653CF7DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 12:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236471AbhGTJrc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 05:47:32 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:6373
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237769AbhGTJq7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 05:46:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3uJdthQBCLxACwRd/oNAInhBTjK55NFQ4vX664WCCpMPLQSZmQXf2F6Ph8Df/zI0y/p/YB+oL/zKM7R5DUAPfi8qCKvCe+wgoCAy962Folk4i3YBabWgv8EawFH+4Hm7O2q8DYPUi+kRcnQjnf3bgj5NuqO0NrKAiDhyQbXSlX3Cwz3/0c7YIUHiO2WPj8NAUcPHsNzAOii9627lskxCdpg0AQKRSKsciaJcleAOOpfGDaJa/Bc/I1NmFcG3/Nlmt1pfo0wpavRx4S84JTfWUEEgwXaRid3rPZ2cFc6ksT4TVqAoeuDKTYr2QqdT1iQPWKPkHwLEu/baJtRPkA3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpUide7I/rusA4jOi8SgX1vnDAgUKIULyskPtps9cUM=;
 b=Yp7dGSD4Y3T8EeNMm4n08KiXbjzdPNERu1vR+PXOLuo9YoVwpYaAoZEgWc/kR/kVcGO+wrEKP4SzVvajy/Z41ZlJCOLRMz74+CPT4PRhsBEjWeHsOeCmM1dg9kZI4HY+YYgX2qyUNYJ7B4l/G9Jnuv4g7q4TKY11locgLnkvl6RdDVM1Rl4iCfqHAtFZ5W4Ju/Fbwz1XrVE9p8PmlBC3UNTOmfkQWVGTrR9ORJGm29C1G/CpyDHmh0nmmTd3q92I0dcxvwwfUhO8vfFgmeKb6juapAZrxQt4b6AKUx+TQm/HRXH//bNNs02Fcp5zpFcgm7+ALb4Ssvy/7WSzB0gw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpUide7I/rusA4jOi8SgX1vnDAgUKIULyskPtps9cUM=;
 b=Rzm2B2oGGNYqlvW+0dPNNn1lyiKMc6jWR8MorTpG0KehYNSpcD+mDj9ZBfAck5qIg38+8dmhi8KA4wy3Ct/sytbCLqCMQYxfG8Igtg+xAi583juNw4PGQW/bN/et6S8dcoCg7dlZ2d2MNBb7AR/jJ6SkxiFq/kQuxyeu2yB3vi4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6368.jpnprd01.prod.outlook.com (2603:1096:400:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 10:27:35 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 10:27:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "geert+renesas@glider.be" <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77961: Add iommus to SDHI/MMC
 nodes
Thread-Topic: [PATCH] arm64: dts: renesas: r8a77961: Add iommus to SDHI/MMC
 nodes
Thread-Index: AQHXeI/gUkCccICb1k2+mDDhF3qp+qtLo8xg
Date:   Tue, 20 Jul 2021 10:27:34 +0000
Message-ID: <TY2PR01MB36927CAB91A6416E636CE77FD8E29@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210714090843.438076-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210714090843.438076-1-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b274c54a-ffad-4cf9-3f97-08d94b68fd4e
x-ms-traffictypediagnostic: TYCPR01MB6368:
x-microsoft-antispam-prvs: <TYCPR01MB63688BD5D643039ED0BAD702D8E29@TYCPR01MB6368.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KiqeITm7l4eQe1YADmyjIk0RjEPCfSjPQr0Y6wA/3e/bsTSgSwMQ5MjsABNQesH7897CfvfznFpI4g5707QWaSOseJN4evZhANiNo2ylctNxkcM+7qry1/4BASrScBooKokWKLayAPY8/WxCNKv3Zx9c5x85Un6Y+ET04ohw+JIFgg7+TduSW4s0fjJPUkRnRv9apVcnv+Z8OlQbqpS89PMmXEkCS1Nk5oJsH52B21hdn082832yTzKpOQ9+K8ELbbXtxbBjbiqderF29qZYhzUaO32ItAQnqFc5I5KxAcUg82/b/T6dJo0T7v3clRkmk70b96A7n3l17t6p1fCTu/sEcoEgd9Lgre9DWNa39PbdyZL8kYn4LGuku5EGbMCgEYAJaeD8E0adL/1boTyCzy4RfVJq6RPyctDExdNWVksahPniEHj59RtR9+tBXUeiP3KquYy0dCwbqcN7sKCzuO0ULhsexQQRo5w0MTa3uv6juoVxqqb1X0f3XL3XhRv0SKU9NRl8UY+5IT8Ok+NrNbRHk9000pcW7sRmYaEki6NcbTq0NRIuveA8RxTRC6fPVzeerruzSimiXrx6MyKjCZQeBmDE3wvvb6/yU4j2MJXmxEE18LforjMdMdYpGOQgm43ZHox0p2No7FI9I3/0OCU15+Vn9oTT2k56C9sEhG7cccWsjnAraHN+nWgQsfJkD8Kax8xGFmizvaJE+pX6zA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(478600001)(7696005)(4326008)(86362001)(6506007)(38100700002)(9686003)(33656002)(186003)(2906002)(316002)(54906003)(55016002)(26005)(8936002)(83380400001)(55236004)(8676002)(122000001)(5660300002)(76116006)(71200400001)(66476007)(64756008)(66446008)(66946007)(66556008)(52536014)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TrSkK78ocrLK6Y7KYNwR7q+SyZgTOLHaSI8yqjGJjg8Xat3Y9ba6SnZP3eng?=
 =?us-ascii?Q?Nfxyaj0KTgmzbbc5BQRQ02fje9auAinAILekkkB0nAxlAxbO4KS6ZlEtrjwL?=
 =?us-ascii?Q?GTfAPG2P6UTBvVmEVVTy/XCNkI8rVtXgLS2qwstohJJq59DFDGVlNyyQ/4gx?=
 =?us-ascii?Q?iXC/fEyHJdfzNXXrkH2bXXqvM8oQVB7BTsw9EbIe4Ci6tBVe2nphOStSQDM0?=
 =?us-ascii?Q?XzlhHVs6zqbk0YZaGbl40F31dAopwcgDhZmiqToH7UsOmj91LYjReqbuk9lx?=
 =?us-ascii?Q?2HqK2I2M4oJ0xyUj8ERU4MmLVqSg3fH4Dh/lw2TD3uzX0s+lhEb611GGkIDQ?=
 =?us-ascii?Q?AqaWS3KBvp4fcb3I6W67vUAUL1v6qwZ19FVtuA7ZfT/YtDTuNWgcGQePhv4P?=
 =?us-ascii?Q?ePTgvhMWxTJxRglErRgOKbqiP3gpSWL/a6hyyJDHKYEgVm/V92px0ljJ31/U?=
 =?us-ascii?Q?jfKshp33w4+455PqJR25CFdFQ6gD77vgulEgfaiF+CTbHorkS8gyBnMJpFP8?=
 =?us-ascii?Q?b/w6cY74Z0V0wZAPfGvGkQmXdAcgsvXx/+UsmmAXiNm5x1aYb9YPu2H/ZrWj?=
 =?us-ascii?Q?6Ec9eIyw/p9lcx5LjWxPo5ogIDUmQ05kk1lixTNf8/2P5DZoquZ5NmUMbDAm?=
 =?us-ascii?Q?zbF7N7dA11R/rEJrwxaL2AHcEwqblN2wQYQ67jPqrHERVb6sAAHd15COmeTz?=
 =?us-ascii?Q?xnC7JhZZAfZWlho7b283Uf0eaeHtGpUW5IOsyCIyoHAWQeEyWR+fAL0KQBCN?=
 =?us-ascii?Q?FV+j4jaWnd11dlKAWZovKfPS7vn0lHyZYZOMr4Ol6/4kuijSfztWjBQvILZ4?=
 =?us-ascii?Q?isKXI5EjDs136n0KoKfueRva4aAnPj2kpRn5w/w7PSn9HSx6P4/58zcvyicc?=
 =?us-ascii?Q?37SWn2pe/S9qfzLR9BHD2FXNoUI7fbM7lIah7o3OMl3NU3mkZ/TMnIuCHDJe?=
 =?us-ascii?Q?iuhqEuh/tgaGQFx6+rCSDkyVOaMrlqdfk40HRC4/aXmZVidQzlsDQlHSBG2S?=
 =?us-ascii?Q?tLi1tpmIvuA4QZiFW4Eeo6WpQw54PuFX4RqK2suWfdUveMzWk/cSusOo4oJj?=
 =?us-ascii?Q?7mHUaNqRvAhdMH+PHY6pa23VOWHn14GrsgHzquexi8hPWJm8DHdpw+c2BIf5?=
 =?us-ascii?Q?2W7tItLzz8RR9xVIyBy+bnn4dXv3zuHfZ+5reh1Z9iID0eUciZqFEmFX868b?=
 =?us-ascii?Q?spj2oLSVtamThiYP1knp46WoEQNAoCH3A+Fw9nITYVbxUbcRXhBYeFqCjDSM?=
 =?us-ascii?Q?ZpZqZqYjgQUCHAn6ARVvIbY6aD1jn20UzWj1VN1kbntwBZdul9V46Zjp2s4q?=
 =?us-ascii?Q?YFiOiC8sAcpl8tBWbjVuNuBg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b274c54a-ffad-4cf9-3f97-08d94b68fd4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 10:27:34.7192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZeIZeOkcKEqyxJwQvtxfvfTMMntLbWgxTeURONQfHdfdCHH9WlLMW9Q8s9NgXzPanzFrRIczsZN4b8oglMNOVC4l9kszcUJRiYNqiwiXbk9i87Q8KLRBfOXa4YaHow5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6368
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Yoshihiro Shimoda, Sent: Wednesday, July 14, 2021 6:09 PM
>=20
> This patch adds iommus properties to the r8a77961 sdhi nodes.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I realized that the r8a77961.dtsi is missing iommus properties on dmacN and=
 avb nodes.
Can I make incremental patches? Or, can I add these properties into this pa=
tch as v2?

Best regards,
Yoshihiro Shimoda

> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77961.dtsi
> index 91b501e0121e..6e80fee23891 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2280,6 +2280,7 @@ sdhi0: mmc@ee100000 {
>  			max-frequency =3D <200000000>;
>  			power-domains =3D <&sysc R8A77961_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 314>;
> +			iommus =3D <&ipmmu_ds1 32>;
>  			status =3D "disabled";
>  		};
>=20
> @@ -2292,6 +2293,7 @@ sdhi1: mmc@ee120000 {
>  			max-frequency =3D <200000000>;
>  			power-domains =3D <&sysc R8A77961_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 313>;
> +			iommus =3D <&ipmmu_ds1 33>;
>  			status =3D "disabled";
>  		};
>=20
> @@ -2304,6 +2306,7 @@ sdhi2: mmc@ee140000 {
>  			max-frequency =3D <200000000>;
>  			power-domains =3D <&sysc R8A77961_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 312>;
> +			iommus =3D <&ipmmu_ds1 34>;
>  			status =3D "disabled";
>  		};
>=20
> @@ -2316,6 +2319,7 @@ sdhi3: mmc@ee160000 {
>  			max-frequency =3D <200000000>;
>  			power-domains =3D <&sysc R8A77961_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 311>;
> +			iommus =3D <&ipmmu_ds1 35>;
>  			status =3D "disabled";
>  		};
>=20
> --
> 2.25.1

