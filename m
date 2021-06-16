Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE4C3A992C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 13:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhFPL35 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 07:29:57 -0400
Received: from mail-eopbgr1300104.outbound.protection.outlook.com ([40.107.130.104]:47808
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229502AbhFPL34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 07:29:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq6MZay/oGPuR+hWz3Ga63hu6KVxj0QzmFmLr99tssPmHuxDU19e5RQaT+DuQvBeXPEyB0c7jc820iHWgWBEKZxKCb63wdnoGMKrHssCDhsTPMi0DpdEgNDi1Qj1dBG7Mq//Djghovzg0DIvf+tlZw/yCd4sDKI90LM5wucwqddBZTBogN+LnoAkKkfguxEJPoYm4WQHg4amt7oAXFjSeS+bjLSrugw/GDW6OxsTBQb7QjHWs5xLUjtSsR5YTc9HKDpy5OumpB25EECx2aVA4JWSP6Sg6YePF8d6Fz1gDIyLypHqTPOMFCKxSGDDJGElkgyGa0i660k8P5KfGbanCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDw/FeIihC79Ww2jpybz8e5arrZH2RWHE4h7iyF/5Sg=;
 b=YNKfENLubCGUQONU3rzrQ7kJy5i78TqEyY8hRH3MrcLg1K1CzRRAOaM4UJ3DICCs7nw/nrzBWov5j/y4aLoaC6hUMeTsVFn7zKfyayKWyXTof93RvXS5nJJcfaq6Mrh3s8cACmVpxdZKVdDkac5+Nb6Rk141k02P7inTRqhj7D1CvTN3T9ZSvj29IZRwtiEzyF9ZHPdS24NU1tLFQd+BVmsOXyBvySks5ytBxzmnzFgrRNIJpcZPL2vWEBdDnv+IFl52TkzvGQAxlsRFp3Xr9gYNQ61wvYfOQDlstzAlPltvXk22cgii0bsf4+SgDV7vRrC645rbNdrUUzIBYYVVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDw/FeIihC79Ww2jpybz8e5arrZH2RWHE4h7iyF/5Sg=;
 b=fMUzeQPnY53inmEDepk8LnlcvSyTIVAjJkukoSiRoXKsK33zZmx4pWuCf/4dwFpqj1Rj1c3IM8LNRMGxEfueEsxjH+yzTZj3LrPKiE9ohTm+ZpglgbAPHeTy982MKxypJjstjMpEmiR4n9JGctwhRbUwV0DiEk7Ek7ZRqU7FAJM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3113.jpnprd01.prod.outlook.com (2603:1096:404:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Wed, 16 Jun
 2021 11:27:48 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.025; Wed, 16 Jun 2021
 11:27:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH/RFC 14/14] arm64: dts: renesas: r8a779m3: Add Cortex-A57 2
 GHz opp
Thread-Topic: [PATCH/RFC 14/14] arm64: dts: renesas: r8a779m3: Add Cortex-A57
 2 GHz opp
Thread-Index: AQHXXdxG80ARNcucDEKu/c2k5yKwv6sWiRHQ
Date:   Wed, 16 Jun 2021 11:27:48 +0000
Message-ID: <TY2PR01MB36929A8366B7F9DDD7D01CD6D80F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <6dbc16b1345913cb42d8824d1c0f7f5be7645cf9.1623315732.git.geert+renesas@glider.be>
In-Reply-To: <6dbc16b1345913cb42d8824d1c0f7f5be7645cf9.1623315732.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:81de:11c4:e195:fc55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78920c0e-d7e1-41e3-4061-08d930b9c515
x-ms-traffictypediagnostic: TY2PR01MB3113:
x-microsoft-antispam-prvs: <TY2PR01MB3113DCE2EBEC0F58449B53AED80F9@TY2PR01MB3113.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vwzOwZrDYhz8gtOXZBN/ZyEdFJpLUom94+5anM3TlB37qf333K8Vk1mjuxk8BleI1F/dV9NG99aIf9/5mNG7Nbg370eleYoVgCdV6CZhVSMS40fZxbPqahcYa6bSB5o3IKdniVbMhb7k2kSTAPjzzEuMhPWE/fmrCqWHABJ8otZbyzTTsDZA2/h6Dmr7ICr26Y7ze1eCUG2+yT8cb042SjtHqSbF9EqDaJFx3xNOB01evuWUd6RD+MTyVVkRnao+QZeyxH8mh3YUGnMdH6yzhoOR2Zqa6DrmfMco2m1ylhd5umAGwIBvTPsHObbVRrQE+wfztTeRWRSIvPFgH+xdXiCE++/LkQQwKT0p7TX9nCcjGSvf1h6r9P7MYSR36uHFyREHDly9rKJaKomnKfbIW6CHp+UgZ6yP0cKHgpoN/H5zLXQm+fufkwL1C26aQzdLt5Oib4sUK2OSQyNng824TDLWzqgueCUeURL7cbHQXGKI/RflK6m51mIv3s6q2ii/scT6GnlUBYz8W4AyHdn8KgEv0EzF46chWFHAs0iMMHZVo7WCWlbKlxjDbj/29pkU1qkifTo1ZttRoVCsyr/zeu6nkoZ4EbCbVVDpkyzha3k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(64756008)(66446008)(86362001)(4326008)(8676002)(66946007)(66476007)(66556008)(7696005)(54906003)(5660300002)(478600001)(52536014)(33656002)(76116006)(122000001)(55016002)(2906002)(8936002)(38100700002)(186003)(316002)(6506007)(71200400001)(9686003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qZ6qoM/gJorGn/unKBON+l2xwja1QyUNpa977St3ghWVJ+yHUZr9OWYHXVyX?=
 =?us-ascii?Q?CdgQdbiX8v9/idjtSaLMq3Pvs5sfuYjHYtkSeIX2kjrClVlzGUkMPyOAFB5y?=
 =?us-ascii?Q?DK1jvAzufgK0hNKH8ha2WDk+sJhhY+u4wj9dv/kEqqPfCCjLgPO6XrlU47dC?=
 =?us-ascii?Q?KsaT8BhATbx8FqTygo5Wou8z1fS25Dd7qVMbH3YxcrKN02Z9+NqSh2RKoCwT?=
 =?us-ascii?Q?l1so2mOMW6XL+9bRjHQaxtidXlDANRT0SU+6NohGT71lj0rRyzLTvknfjtyW?=
 =?us-ascii?Q?qMOQen052U11ctqOc1j+KLJEcp7X8BfHNUTeanqC4Zi0POp2VK0rYZOwRbht?=
 =?us-ascii?Q?bqAgdycPK0tgn2WqnaxY5fxE8C7hrKIpdTF7wU2rwBzrdG8cxwIuTymmvjfs?=
 =?us-ascii?Q?Jph0vIF50q3MxZMbvnLb18IglV9ccUWQxDcAfBwpikrO/ufysnZRYnkE171y?=
 =?us-ascii?Q?AVronS/RFx01MSKFUBjzUWLyRF1VQUhL4TzIABpgNUY63eDpgSq32j5AzMmW?=
 =?us-ascii?Q?nWpuMIddOGpFoVpuhyzERe2qddie7GVnI2hsTarWmwVj6NlQK6GRpQJFMN+D?=
 =?us-ascii?Q?YNOgV1zldIffARLnz0A1E5M6h7y/eWGPFug0b62oex+9fXbHj7d/Sx8rLBt5?=
 =?us-ascii?Q?IPRS69+efRWKHn2UnYhTt1tfmUtxnJaflTJHMhoPRfNGRRCF4GqhE11cvEKE?=
 =?us-ascii?Q?i7R3qA9ujkQClAdVfdmDhSGr2TURQSy9KRQMJtqGKqnvE/koYWeehYAwMBDu?=
 =?us-ascii?Q?QQilF0lsK+sbtfM3OH/K5HYSa+2OT5VYLfTje5SMREyn6Zdqo7WS38z9ok62?=
 =?us-ascii?Q?YOA4DGl3ExNLVQkV0AJSdBilvAeGqC+A7Skeb4Vz8CudgoGJIHwlEgUFeatP?=
 =?us-ascii?Q?JZKDdouWqKb3L4NraQM1tl8peeHVsBUr7AQUFatp57Q6/l3hIoib0VcQXtq0?=
 =?us-ascii?Q?ufIY4Ouu9cmeExo+yYoDy8uJW47BlEsAfIXIHpZ1MtpY9ww0ee5HHlVu3YJF?=
 =?us-ascii?Q?uzsHyYE3GQM/Smd+FfrCnfwWIlDAW+uNMgiMUtM17MlDqBTDFToE8zirPmbE?=
 =?us-ascii?Q?hJl26cH/A9c5Os35IqVi9dsqk3ZuEDzWdw+9Y0CCnOZ2J/OP7h88P7F5GNus?=
 =?us-ascii?Q?6JgBiJ9ClUN6XVh4nHmILTLqHSZxZ+o6AdPM98GDAeTgibykTnGACtKc4x0p?=
 =?us-ascii?Q?pbHBXnTGSAjUcdng2d5UJxQHcM2m4nmF6nU/fEcdNHw4AzcYub8QND3heAvC?=
 =?us-ascii?Q?G4x87e4tSjGtEyzvH9FVPZ5HL01K84WCJOfEm09ou2/u1nLNPk1DMRpL2xSX?=
 =?us-ascii?Q?TZP7FJ9vr+xYEkL3Xbig7GbOF7DPHp6fFx0yC1trasYeYMbh+O6IBxcbQe4Z?=
 =?us-ascii?Q?UtSx2ws=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78920c0e-d7e1-41e3-4061-08d930b9c515
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 11:27:48.1963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVylhJP74D8LGxdiCYXeaPSZTIrrUKLB7ejf++U7iDmEXlTlA86s0r4mjL1cGQ3vIikj1jq7LmdKUNfNSMLHPY0Io6qVqsnG0MeTkF3Txns6FPESKcVKzDnRwroHBOMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3113
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 6:37 PM
>=20
> Add a preliminary operating point for running the Cortex-A57 CPU cores
> on R-Car M3e-2G at 2 GHz.
>=20
> The opp-microvolt value depends on a future update of the Electrical
> Characteristics for R-Car M3e-2G.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a779m3.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779m3.dtsi
> index 65bb6188ccf5470a..fa5e8ffdf7343739 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
> @@ -10,3 +10,12 @@
>  / {
>  	compatible =3D "renesas,r8a779m3", "renesas,r8a77961";
>  };
> +
> +&cluster0_opp {
> +	opp-2000000000 {
> +		opp-hz =3D /bits/ 64 <2000000000>;
> +		opp-microvolt =3D <1020000>;	// FIXME TBC

Like r8a779m1, I heard this is also <960000>.

Best regards,
Yoshihiro Shimoda

> +		clock-latency-ns =3D <300000>;
> +		turbo-mode;
> +	};
> +};
> --
> 2.25.1

