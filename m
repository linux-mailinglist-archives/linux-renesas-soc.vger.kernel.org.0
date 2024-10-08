Return-Path: <linux-renesas-soc+bounces-9604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D6B99557B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 19:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E9791C21576
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 17:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BD71E1A08;
	Tue,  8 Oct 2024 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dcd98Zj/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8ED1F9AAA;
	Tue,  8 Oct 2024 17:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728407962; cv=fail; b=Ihwpv+NGYsnD3XsbvV3LMg1yv5s3zJy+riFFNjOY7PP9wRNQRcnrOBBiUlf5mC9qTgGiHddUlYMhr5XaTfRjM6kV/li6oA+xi8pr8bfPqhj3l6Q7YTnYRjgTWo8BQEIuGUhz+YzzG1CrBKQj5nbei+p9zFdexPY3c8I76LKKBkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728407962; c=relaxed/simple;
	bh=lndbYseR3S1FVexuAHA7m4K0hQgDsxN+ltSiPT7T3Bs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ITWXFcyU7xa7qunoPZnBqSieZP78/bQepmOoRbVfT2+uhUSv6g5aSzbaf2/wakG2Qs4r5uAPlztIfwFbdPFRQaRfYAjHjwjJRQYqX7jMkWIi+r/cq+TZNv/BVu5kRjfClW7afc9vIax9yszCWOyXl108ol8cKulHFLyjTzq+skI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dcd98Zj/; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoodqMX/J65al140Lz/MGAiRBvuYld5cLCjUrtxAkDkMiJhM/LQqyUDJblK9nHLLGSdcsSPntWjwUgEhE5bzM2Kp7tn/wV5Mz/Q1r1On+1Q5CKOZqi1X4tE71Jxws//UzFD9P/x8tG2BQsHHT92+QJOi/1aLRxQ2vxvhEmgCka/X8jEWjgk8BlxLqDnaHiHiobpzj4ReFdxt5kov57iG+/JT7c6arHLSi3ZcQ1767Bzee8AnBMLXexcF0zSU92FAUKOREu2SLi1AOmShbXxgcP24q5CsYEzsmnmGjpis2MT5XbGoXXlO2+OojScQGOYQnlkyYK1lB8IlfxlWGBLpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNMEZ/+wpG3DKBo5L1X4gUj0d5tUG8L9pYN9uTcMWuE=;
 b=ewm12brCu5HdH3dofdsAIfLSuhPlsgRVD/ljZ3itXR/ouka460dRfeMD/ooIvEj9H7k7tt34lpu0lrHKqMRmL4kGKB9yfwmgdwM1CQW3V83wl0XmIJBVG42tSHiS69DXEieo+PcjIBe3Ip+W0Ee2oJti5pYPJtCb15fw3L/QOR/rU4rqRl1TanQkAZTUNYdzfRoUPrDCiCasy8lYERIP0R7ng12L2+CXRjrPGu2i5J7xCZTQDEAgApb5mRNvf3EI5Jrr9KqKWO+UfoHB2X3SZvg0joMuaWE2L3rXfWZAKKfTvZrf+NVhrNGHNKF8gjAfBJTPTm6Tn0OYCuJhy02SGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNMEZ/+wpG3DKBo5L1X4gUj0d5tUG8L9pYN9uTcMWuE=;
 b=dcd98Zj/+MJO+KANlDeFBOSTWzZBozEW1GfpvTOGr7AsMs5EOuu+OZnE3ZgXYKl6Ojq/1ThII3fOSGlWoPsKb58yvp8kB8yq265Bljqe3xGu1h0l0qzbuiZH3ucdD6Kw+swW+/UxrUuCte8yBce0VhNtSh30IznjFDE+FBfys/s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8444.jpnprd01.prod.outlook.com (2603:1096:604:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 17:19:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 17:19:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Topic: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Index: AQHbGaIZmx0KhA/2XUiyPZAzZz+L/7J9FRWw
Date: Tue, 8 Oct 2024 17:19:14 +0000
Message-ID:
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8444:EE_
x-ms-office365-filtering-correlation-id: 5ad3bc0e-9eca-45a9-6aa6-08dce7bd551e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?asHCg+hKdZD5mVIqpoDQnH1eDpeRl2VTWNKApZmXYYAlL7Cjz/94wG9UArOJ?=
 =?us-ascii?Q?p+gmcKZithgZ6FaTL7uQExFGuWksmOFS557VlEh7zxCAMAJHorMqMDVB0TfK?=
 =?us-ascii?Q?8juZehWDsT4bLD9n5bg7Tx0wK25IZEiIzqCSnFdjH6i6Ju6NlQt5g5z2Wgde?=
 =?us-ascii?Q?p/x3v75B5dEI5FQYG58sPbOFgAxqo8JMsSAdUrUyI6Bjsvv5tiRmwZE6rkdM?=
 =?us-ascii?Q?Nl8kUEXe4bpoSFBjT4QLeE5FZwxNrZWxZZeU7UfjrCPK7v2yBbeuc99mc4a8?=
 =?us-ascii?Q?nLiwUUVW6l2WeDP5WJ6Ua4aT0KmQ1l3P0Yauxe39PodBHGX62jcLSFROk5NV?=
 =?us-ascii?Q?uCcrigj4DxjLow5UTzQ4oaleQRnj6Cyq0mysnQXMk1Ki26D4ZdVBloDGfaod?=
 =?us-ascii?Q?yrNx3c+w93h/uaGAiYNR9AEVIAC9n+gR/7s46Bhur6LN3RooafnDy0wRdFBG?=
 =?us-ascii?Q?k2XOQnniIyoGkSIKcJljS5MBGfigXgRXXt3wK9hh8Nwk4BO8/Sq6x6Ks3Y6a?=
 =?us-ascii?Q?CxqhNc9+JlgIBf5v7eIrwYmpq7T6NbAX3DPbB1SCQ9D8kX2L7kFJ3CJW8yB0?=
 =?us-ascii?Q?/Xztti5gnw66C47DdfSLcT84Ir/wkMmf/Avke32iekCnCVneOjVN+hoIyxV4?=
 =?us-ascii?Q?WkzFb9oH6P8/uhCZmCENSXtfkZEGZTelMQBw2Wr2XWw1ic4z3f/Nenjf3J9V?=
 =?us-ascii?Q?9dC/5kNvEv3hh6XnRkl2h7z9mPpPnz+FCwvm/Cs9r0xtMFIBf46AVRCh6+ci?=
 =?us-ascii?Q?zzME7rxwfNxnfLn9NqDReXZFTWsZz9jxUwuwLC75aBWqo5nNnVwld7fOlw8A?=
 =?us-ascii?Q?htqt53TGBG0gVINjkaXrTT/Cis4Eq3eT8iKbIfxVJrtCa+pklNeOw0IoSrEO?=
 =?us-ascii?Q?D/saFPE0qwF/pWPuPCOorbIB4RPCWrBYwlpt3XGvpuQHYLsHMYPmnhNF4aWx?=
 =?us-ascii?Q?lJeq0CSS2rzkO37hUdbuYc/uWzcsQnvAJ3k3JggkWze6HCL1A5SBqrHOVxZS?=
 =?us-ascii?Q?CqsblQAD2nYpak4Yg4hIjgQyFJwQds4ES9WNiOQ6klE6lw1HOUoSbCYyzdxu?=
 =?us-ascii?Q?dhfEBV4iXiazw1yClLAEYlTb5RmZ+2kT5f+4b78KaH68o13fbDpEOttKTkwA?=
 =?us-ascii?Q?nh4MojKd+s0gqw3HPtNpoVNk+NL6SWQ9nK7mrsa3jIMMOEgEL3wLcvQGewaE?=
 =?us-ascii?Q?Ks0cGWZBd83ZrNZMqZEdEBKPE9VClQlqEt0eQObrVSqkoDdKRAg1kkmCtBit?=
 =?us-ascii?Q?lbd5wgV3hAm/bhLcBimF33TkNHSAOHCPlYTOuzQP7cWV/Xo7tMFsH72FmLZ7?=
 =?us-ascii?Q?BpNAilW/xeYM/MG+DKMvGNj7QA1ZMY3A+BedSZSU5AEBJg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?viRJhpbUhSAi2J0dVgz6+moKWUJXVikVtGuBxnsgAlWyJ8EP4ad3uF3vWSDH?=
 =?us-ascii?Q?hiQnAoKUJxHIHx//fBnXQFz8CRUUxzWV2zsQqHNsIdsixIE6txLjxID+VDmt?=
 =?us-ascii?Q?g4Eo4ebn92DL9GdGKBIPTfY3przRbyurntCGp3KpvaQNv2EztfBtuC1OsG42?=
 =?us-ascii?Q?phZRVKQsNoEO+JHLf2IIyRKL3cEDO16Q/ZjlUmTvIGZOJsTrp0aYqFGN6K8V?=
 =?us-ascii?Q?T1YpKdO2FgaylZ2OjTeRO1DoA8YpMphh7b0manG61DzybrlX9CwU6RCNjUEI?=
 =?us-ascii?Q?u1yRv2bfmcfc+PTIEejX0TXPqBAQHzzI+pHsV6G7ZewPM5zbVLPUtx97Bqja?=
 =?us-ascii?Q?ahoslNeIYUrh7TsCMZwrkCXArSmO/YmPXOCAWwZo/AAy5Wp4Zg9968TPAhQB?=
 =?us-ascii?Q?OAx0WULkAzYEMTe1qcg1bwa0JhkBl+TPtvTJGPTVIbjEsbCDoAsfrCddCGEK?=
 =?us-ascii?Q?qGgVqZDoWzskq0GHofkr0/zgECWMHR7WdUnHOVF6R0BwutY8WSaZIKU+BmkM?=
 =?us-ascii?Q?/czOvNtg+3a04isgHFm4Q3HBkWT3kWWNguaKy0peoW4NpCLqwnvqvlEnjbfu?=
 =?us-ascii?Q?wWnQRYB9Pr+zrvpsuipKxsX25OMvibklbqN6IPwZQuNjcAqP8cquN5SLai97?=
 =?us-ascii?Q?wb2fOwMgD+yGjNdcgkqpDV4lZ9TGRJ8iDXTlS45YTZ/UkghYKLudOcTAQpsa?=
 =?us-ascii?Q?VYKz5/A2VmveadAXVc5GnLbxXBTFxy6Yh821FGqTGala6hWJUBm3lEYgEO5X?=
 =?us-ascii?Q?LMDZKRthiUjYEphqNvBRwq5trFfGy2a7IBDwTU7QPN352HI79nOnNcEIWATP?=
 =?us-ascii?Q?rsEMeb72+cFSSK7XFKMgz/E788kcuigBi0Nu5uswos2OUAtKx/Fb0h49pIQX?=
 =?us-ascii?Q?dvV+QYGXNp0A+dVilKSi/ecD+5FL9mv/6sIBRucYS1B+s4Al4NLEOeHG0hjW?=
 =?us-ascii?Q?ru+JM+OSwoQ4iVEV84719r79L1dsn6UJz2lqnNAg+DyDEaR/8I9tme3pfQOw?=
 =?us-ascii?Q?jJu+CNtockuXDOP1MC1hYenAY7VYIDv/mvMXbhPIrqMSLX7wCUKufXkr6S7U?=
 =?us-ascii?Q?QETHAQK5jfzWaSJ1c7B8fKSJfXQ1T0Sr7lp2N7koS5t09a/tLDQKSW09+/f4?=
 =?us-ascii?Q?Kkxv0BNYa79x5wfQ9u3wNujJ3nRGIWyOYQVAhsgGHcUScgnnXsmUTRhmWxYb?=
 =?us-ascii?Q?f6q05WJxwujXEiZNf0zvHicjVuHoHd1cW5beInd5Jf6WGIGtZSMFVzJakB9Q?=
 =?us-ascii?Q?qJoAc4YJSwhLCPnZ893pwiQWwyOPAjGkopTVo6g8pNoQXlHSKfQz8YUEcrMI?=
 =?us-ascii?Q?Yjj6YpJfkVObD/IwxKa7c6xAWVDJXDKQKS1XqgPQU9R+qfFDeEEg98KbsL+u?=
 =?us-ascii?Q?42mDu4yrIH80Xr5AvBosWLeiUtAlS3YTVVhzb8HRG9NcHY5nTwqQnwILlEpe?=
 =?us-ascii?Q?bdycWoVYtF7UM/Ag7iadQZzYIzXXyXc781JrBxFusXTcqM4doLZXDIxVE79h?=
 =?us-ascii?Q?ssnG72DQodxnOwk4Z6IAJ7G+6hJvJs2JdjYj/3ZySyoap2wR3sfQYxSEpLgN?=
 =?us-ascii?Q?QOrYxrj6TsDbpgZz936DG4hcL+nXP/z/j5HnesEqla95IpZTt19QzhwILSBa?=
 =?us-ascii?Q?ng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad3bc0e-9eca-45a9-6aa6-08dce7bd551e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 17:19:14.2641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PAkG7S/ckQpJOOcSJ8K1PDC2TT91vyWe8WmptlcKjVp2zzU5vG6s4JuV53DVaNseIdMifcX83NemoXKKc/ppRvH+fLRMGdJpVPQcjCq7r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8444

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Tuesday, October 8, 2024 5:50 PM
> Subject: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add OPP table for RZ/V2H(P) SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Set opp-microvolt to 800000 for frequencies below 1.1GHz
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index 1ad5a1b6917f..4bbe75b81f54 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
>  		clock-frequency =3D <0>;
>  	};
>=20
> +	/*
> +	 * The default cluster table is based on the assumption that the PLLCA5=
5 clock
> +	 * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be set t=
o
> +	 * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and additionall=
y can be
> +	 * clocked to 1.8GHz as well). The table below should be overridden in =
the board
> +	 * DTS based on the PLLCA55 clock frequency.
> +	 */
> +	cluster0_opp: opp-table-0 {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-1700000000 {
> +			opp-hz =3D /bits/ 64 <1700000000>;
> +			opp-microvolt =3D <900000>;

Not sure CA-55 can change voltage from 800mV to 900mV??
Based on Power Domain Control, it needs to be in AWO mode for changing the =
PD_CA55 voltage.

The manual says OD voltage is 0.9V and ND voltage is 0.8V.

Is 1.7GHZ is ND or OD?

Cheers,
Biju


> +			clock-latency-ns =3D <300000>;
> +		};
> +		opp-850000000 {
> +			opp-hz =3D /bits/ 64 <850000000>;
> +			opp-microvolt =3D <800000>;
> +			clock-latency-ns =3D <300000>;
> +		};
> +		opp-425000000 {
> +			opp-hz =3D /bits/ 64 <425000000>;
> +			opp-microvolt =3D <800000>;
> +			clock-latency-ns =3D <300000>;
> +		};
> +		opp-212500000 {
> +			opp-hz =3D /bits/ 64 <212500000>;
> +			opp-microvolt =3D <800000>;
> +			clock-latency-ns =3D <300000>;
> +			opp-suspend;
> +		};
> +	};
> +
>  	cpus {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> @@ -30,6 +63,8 @@ cpu0: cpu@0 {
>  			device_type =3D "cpu";
>  			next-level-cache =3D <&L3_CA55>;
>  			enable-method =3D "psci";
> +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK0>;
> +			operating-points-v2 =3D <&cluster0_opp>;
>  		};
>=20
>  		cpu1: cpu@100 {
> @@ -38,6 +73,8 @@ cpu1: cpu@100 {
>  			device_type =3D "cpu";
>  			next-level-cache =3D <&L3_CA55>;
>  			enable-method =3D "psci";
> +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK1>;
> +			operating-points-v2 =3D <&cluster0_opp>;
>  		};
>=20
>  		cpu2: cpu@200 {
> @@ -46,6 +83,8 @@ cpu2: cpu@200 {
>  			device_type =3D "cpu";
>  			next-level-cache =3D <&L3_CA55>;
>  			enable-method =3D "psci";
> +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK2>;
> +			operating-points-v2 =3D <&cluster0_opp>;
>  		};
>=20
>  		cpu3: cpu@300 {
> @@ -54,6 +93,8 @@ cpu3: cpu@300 {
>  			device_type =3D "cpu";
>  			next-level-cache =3D <&L3_CA55>;
>  			enable-method =3D "psci";
> +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK3>;
> +			operating-points-v2 =3D <&cluster0_opp>;
>  		};
>=20
>  		L3_CA55: cache-controller-0 {
> --
> 2.43.0


