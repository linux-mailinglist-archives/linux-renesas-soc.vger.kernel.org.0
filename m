Return-Path: <linux-renesas-soc+bounces-13444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 35506A3EA88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 03:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 610237A7EA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 02:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D056B1D5AA7;
	Fri, 21 Feb 2025 02:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MehBo5ci"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB00157A72;
	Fri, 21 Feb 2025 02:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103644; cv=fail; b=XLLukH7kFi4QdGKRNi6uksHfe3sruDPAfnCmodbl3iEg7GO8NKLXEwTp/+40E55fkcYptdEVfUVHAVtP/EvwVBBU67J108zjQ7OAhqiJHx+Nj3P9XFM2LrKNmO4L0sI/btL/P5ZlfYEs28hwZ+Uo66MXyD6nubGB0H32+i76SgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103644; c=relaxed/simple;
	bh=jibwwT9HR6XscbzQCPX94/RtCstd/LDNjqcD7L/vDlQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o4vC5JoCXyh8a0dQJTb08qKssL1r/Y7Kmq5WYZmTGT1Wsn4K6xRHGGQxfNbV51zHJ9IQ3+JfuQNI7zeRgt7enc0DW3o5wldGkgKR0ya+PAfA3t7h7TcNwi8gYaBpy38VfX4P93xU9/gOtk1ky3d1DHtu8UcqCi4V3tDZPOFhJGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MehBo5ci; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgDWLMVJj4BC5vQNL6a/bn7dRbQE3oy6ixZvOYqB5u2jIqQTWt7XUqobFg6G3VSd0ab4NLkdikP9VMzxjL97hfKKJ/Ma8RHIy6if/1ZVNO7s8IlNjCj8oNoradXuwULXxCV6Du4KHDNKhX+CovcKm+QHM4EEXU6+VRJjPzkglsuIzMvIjGRyrMzb2eosnki1McYcnB+JdtzkgSQ99e3kA94Nc+FF4c8nQilSVYBk3cWnv2Aq6lpdrqTs4lomgA0sTtAzPhsOe62Zb4LSrhcoUdXgG2hnbAg/39UmdYKLgVz7GJY54yBt4DgcoFKQWZz/suafUtlP6oeeX4BIlBpZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNFq/8w8bvsIeBuO4IFB8YkVLXpJmjcJk+gofObT5so=;
 b=BOf6haN3Xfn1cmRhrP8rEmqM+khGnYuW/uRYPqNlaSfKJ/XpGZJD7FvNVwOfN5T4vegnEoNJOKT4ESZwohCPER6VWZ/qtwV4umOjX9mBSWhBuaQ9D5YJn7rM/vHWxv9fHUChiIecoVV/3cgliQtA2kgzfriMyc83BPuS2ekmVHedo9ft0s2EE2H0gTMyJZRDeiC+MTebOTTud4RZ3aYCPzIP6fQi9OH96Z/yR2+xx+u8Yo6lmh9TVV6uQXHNi3GKvMk0wYY30/cSU1T2bL+qBTIX1s6tPUQjlT3USD/F21inIDjA6xd0wHNHaxgyFPcVDKF/l5SlrKIL5AYgGslT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNFq/8w8bvsIeBuO4IFB8YkVLXpJmjcJk+gofObT5so=;
 b=MehBo5ciyTUUtuEM+9fsCl8FHhNq55lV92ksH1k5YlPpzQDUzkWr79Izzgi8/ptBLLkCjojVpz0bC6yQqbiJvi20hHykYKkGev6dStnq8SdyDadjJZuYWgQH/8m53iPGJEB5tnlRDOYM9s7E104SObpLcVmgSGAg4CZC1DF+kYc=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OSZPR01MB8482.jpnprd01.prod.outlook.com (2603:1096:604:183::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 02:07:12 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 02:07:12 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
	"fabrizio.castro@bp.renesas.com" <fabrizio.castro@bp.renesas.com>,
	"robh@kernel.org" <robh@kernel.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH RFT 0/5] phy: renesas: rcar-gen3-usb2: Fixes for Renesas
 RZ/G3S
Thread-Topic: [PATCH RFT 0/5] phy: renesas: rcar-gen3-usb2: Fixes for Renesas
 RZ/G3S
Thread-Index: AQHbguh0j0PowZhXfkuEt0vrIqIZj7NRBBUA
Date: Fri, 21 Feb 2025 02:07:12 +0000
Message-ID:
 <TYCPR01MB1104004DC2C272562CF03ED28D8C72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OSZPR01MB8482:EE_
x-ms-office365-filtering-correlation-id: 30cf55ab-68b0-4f37-b7c9-08dd521c746d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8vEPvoqnTycyVNxUiqzaR4LpEkE+aVaz3+T3eQnrJMhsturWlMOwlC9NNKDo?=
 =?us-ascii?Q?U5150pu4piSXmKhayd7inKS7t6JZ58LTNcHd70SmT51eL1rxn5yOKYibHFEX?=
 =?us-ascii?Q?cVbzmSAf3BqMQwclJnbHe6QVG8J8dRPKfQzkjXJtynj63fYi5/LKhopzjGT+?=
 =?us-ascii?Q?e+28GAPd1S1S2A/tEzpeMswxdRyDFMfrZ4DGiqYXcntRP6Qqm7P68txBEkSJ?=
 =?us-ascii?Q?ZOtp4IjScFGvKI9o9BnBDlotVLWDrXXIjzwqE1oDoU1esp5caA1kc9YRMmQS?=
 =?us-ascii?Q?CCgNRZVW6Rudnp8OKqQSFIpq2Zgy3ZpeKAc3mBriVc6k/vpzFqzAe9rXJxlZ?=
 =?us-ascii?Q?tIROWzUk0vHPpoTVOA/7Dd+ucKYjPeIm2O6ULVoDn6Nsro8xY7PRejn7hNYT?=
 =?us-ascii?Q?669d6itGIa/ZA6pHWdAyxke+q5qlJ6+XIltD1k60n6Y6fmxs6zGBnMNZ7a7l?=
 =?us-ascii?Q?9+gmGjbrD7JFdp6uxrCTMsVZt4IEFzKcqN//nxKnMERYLFA3eCp3dzaeoye/?=
 =?us-ascii?Q?EhHWoCnuxVsu0X/OAkO+IJfwgnxuwxuz548x0R+dRVn7RLzWWFSmPkqXKbUv?=
 =?us-ascii?Q?KtRJB+3S0Ozu5oVbgLiujEoFF2J7RQnYxl1NwLA9y+GbdhtUsT2Lt6oC78xR?=
 =?us-ascii?Q?yHXJaxMV0GRH+SwDMKw9RGerCsrQzoNi+Ay4dJI8coBntJ3bbyWwMRWX1FZ3?=
 =?us-ascii?Q?T/J5PmfZGqJg2ja+PQAxSjN5Rp6AH1d2MCmfDz8U+558a/OkQcCkpqEub0sf?=
 =?us-ascii?Q?NJr7Dk/ZnqG6/GyUrZFm+ckcsDdbHnZ8aRZp5zysOnGAXrBmrafGLqUbnoBE?=
 =?us-ascii?Q?qYtXEGRevctDzJnb6/RcT7Zlpmd1+aETIlfy8WDOXX/AAkvh6xD5SGSX8ois?=
 =?us-ascii?Q?GEbZ+hzj9fspKDdP2V3gqtkyUAwM32B6NCdTwkqrqFqTHoJ2uSr7UFjrpVHA?=
 =?us-ascii?Q?JArDOtLtx9Ou/ys1dUaUte7FOxNwIf166KP0u03Wh7dOrRmLGpLQuI1x88Dj?=
 =?us-ascii?Q?rwzV3+JNQXaQNZRSJkUBYyVT3glDh5Oe9Gv+fbEkRacUuKtLMmdLdxN17MDj?=
 =?us-ascii?Q?4sJBHDZIu+uvwGPh+ganD5HJiuIElpF0nkveKM0ieP/DrH1zr/UtW77cmA9G?=
 =?us-ascii?Q?PoxUB/Wz18uQA5wSBm+5SgJq5El0DMhkZsh179eGGrOlkkntPaWoOLsfkbRk?=
 =?us-ascii?Q?oei1u/k4z2lNdATUgfG548g6//T/BxTQV67TalyLiBRY5jLQZC0pHOlk38P+?=
 =?us-ascii?Q?RWecmKOTomRlbB92fLjNrL0dfAeN3urgvUFCEZQFuGiQFNnqEgJbiyNQeMMr?=
 =?us-ascii?Q?i3eICAjg+lMSPDjcBDii7iYhV37ZjaJwfFwOZcq9jMgEqyHH7OpSK9+tQbNe?=
 =?us-ascii?Q?DCo8PmlLHwL0bSHipwp0f2uGrQBq/WrZhZDMbuq4vqBkVkiNWai/EIhvNCTB?=
 =?us-ascii?Q?/e9s4WEl1WBzfRxMQVQPttgxN6FGdI6y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WbAT4JE3sbE1t6COFNNFli4g9Bh3ct7blzpj+WACy1ZkpqY5BpWRso89MpN+?=
 =?us-ascii?Q?/qyAwJ7ls+MtuGDammqTO5d5id1q+12uVIaiZQU+N0m9+e7lojeEomf/y5rx?=
 =?us-ascii?Q?/5N15/EaTQMMjpgGd84ZQ7uvhgoorUVO4n/1JP5lLUDVBuRMN003NHJuKdwO?=
 =?us-ascii?Q?GABVHEf421CAUM9qFw38L5S8aHgSFPwZhNAfr2Co0u8zdP6215IjFCnl8yVP?=
 =?us-ascii?Q?t2NuYkQMbJtu+hRgdZYA3qGsNnYYQigdf04O+qD0hUbZebhmrPTkxKBS0S73?=
 =?us-ascii?Q?R2BpQBsHbg0sQ40gaaKOG4Mq9x0YqGJKj//uJjZCztPNUaiamotHHrZOlA9R?=
 =?us-ascii?Q?lMGMLP/poH8UpfkuDPhofVgM0/w0F9FXW7e0iET/uFdcoSB78uLHnGZYrh1N?=
 =?us-ascii?Q?WShsUElF0qGSmsUINb4zYSWTMIzThkkAwfZvDiRyWkUhPLNjMdsPGPKBSkhc?=
 =?us-ascii?Q?CuKwbJ7X4rkhS4LhQk9WJ1GT6z+2+5eRSQgavVhDiu3tJdVGxRLA91Y4W/xW?=
 =?us-ascii?Q?/SuHAZeaxRZwzehyehk2uPKwd9WsywMcw100GvDowth5YNCDV/DaTUKOzISz?=
 =?us-ascii?Q?vXPWAto5UBPAhWQvE4aJmKviPbEVQJtg2RxKEtmDII3BTKQnV1l0eIuwIdwZ?=
 =?us-ascii?Q?emGDcp414Ov27mMFT8FoigYDNFOpw3Nzl9jeI7kuyUJ2qln0MdMVRIH1HlH1?=
 =?us-ascii?Q?0a5pcDlixstZWk/FlslLTbjqG+KutS3L6wgDaBZJkg7buZTJrmDmQK9jp1lA?=
 =?us-ascii?Q?EeU49tpH6Z3iHE0WIJ0pM9sjfEBWaXbKXbiRHRlKI1DdS/tBUh6WCcTzUwX0?=
 =?us-ascii?Q?IguS57Q3/yJ7MXhVubIO6GBwGoo8lQ8DXFJ8eEQhzH/YzAIvqY4H046K2MFR?=
 =?us-ascii?Q?Aon/Wm2ODIz+GkU6RsSLeBVFGy3wwM/IYfsx9Pl1+hnBwrsEN6L7+UuKEDjA?=
 =?us-ascii?Q?3ed49dLwnOSOL2oannoBqxe4NzKe2dYIlYMm9g7pkUwvxOQYcGeI0nsP9c3j?=
 =?us-ascii?Q?Eay/ZnlwOww4nLN8YhD9J6MpCbOxAn6t7uOwYFqQ08/Vc48l3RCJfME9EehB?=
 =?us-ascii?Q?sfPZZPFWyS4OY4wYmuTMS1jiWW+rY5s2ua59zm6iMK5KeGiYEfBHQt5jL4Cx?=
 =?us-ascii?Q?f59iLc+7/M3qi2KxqBlb5hE7LV2C7au/dCrPsUyde55oLTxcBo5z9+gvgBtb?=
 =?us-ascii?Q?8RguxSPsJKu9kG96GPolgmG0Bg6tzqoKTrBZCC4Y2h61WywvJLOpuGeT+eH+?=
 =?us-ascii?Q?/c1Y8YfpRPAt7GiL5jshJr+nwiUDnyKa+UOim46Mr501re5IiHpYqHSkE7MB?=
 =?us-ascii?Q?7KmCvEux1oFtAnNiKZwDx58Z8eQSmMSYSRnGmIQCi535uzE1kUdGyPEUVbIV?=
 =?us-ascii?Q?ZyNbgIhZ+qMe/eGJKdJ5YLHHf+h4wAUueMzZY2yhTORdu36fBdwLd93bqNFm?=
 =?us-ascii?Q?blXBfFp02/09joscuW2x5Tg49UYZ5Czh5Ptsyh8qM42GO+HCRglEAzagMCop?=
 =?us-ascii?Q?FDx7DqQV99ISyWlu9xFR8OhMiLlsmAvEhP9i7//nk2OKKO1FXawzpdk9xagO?=
 =?us-ascii?Q?Gkh6JpPt5qdovsNs83wgjd5vyRYPeEk3YKjGh+4Xy4YZMPyQhW+6XuXQRcvt?=
 =?us-ascii?Q?qVJtpwF16HzpT7tfC6nrFlzw2f6c+alsnajMfbMyfWclMRgdMJbe4HRD9D8a?=
 =?us-ascii?Q?mYIacA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cf55ab-68b0-4f37-b7c9-08dd521c746d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 02:07:12.1563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsQkKXD3oSQvbRwzQhw7I+DZnNnNt1jndC/KzT1uvKV+4iXvdQBZKfQ+ygvf2+fAYkzL1KkTosivdI7PY0+U81no5WMozkzCPP8RO9yu5KNDS4dBE3qbEzLJdY6+/ZDj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8482

Hello Claudiu-san,

> From: Claudiu, Sent: Thursday, February 20, 2025 1:08 AM
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Hi,
>=20
> Series add fixes for the Renesas USB2 PHY driver identified while
> working on the Renesas RZ/G3S USB support. These changes are
> needed for the upcomming RZ/G3S USB support (especially for the
> power management support).
>=20
> Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
> unbind/bind and data transfer tests before/after the unbind/bind.
>=20
> The unbind/bind was also tested on the devices with the following
> device trees but w/o checking the data transfer (as I only had
> remote access w/o USB devices connected):
> - r8a7742-iwg21d-q7.dts
> - r8a7743-iwg20d-q7.dts
> - r8a7744-iwg20d-q7.dts
> - r8a7745-iwg22d-sodimm.dts
> - r8a77470-iwg23s-sbc.dts
> - r8a774a1-hihope-rzg2m-ex.dts
> - r8a774b1-hihope-rzg2n-ex.dts
> - r8a774e1-hihope-rzg2h-ex.dts
> - r9a07g043u11-smarc.dts
> - r9a07g044c2-smarc.dts
> - r9a07g044l2-smarc.dts
> - r9a07g054l2-smarc.dts
> - r9a07g043f01-smarc.dts
>=20
> Please give it a try also on your devices with [1] on top as well.

Thank you for the patches!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I tested on my environment (r8a77951-salvator-xs.dts) and it worked correct=
ly.
So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Thank you,
> Claudiu Beznea
>=20
> Claudiu Beznea (5):
>   phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
>   phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
>   phy: renesas: rcar-gen3-usb2: Lock around hardware registers and
>     driver data
>   phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
>   phy: renesas: rcar-gen3-usb2: Set timing registers only once
>=20
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 134 +++++++++++++----------
>  1 file changed, 74 insertions(+), 60 deletions(-)
>=20
> --
> 2.43.0


