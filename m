Return-Path: <linux-renesas-soc+bounces-14791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70BA6E997
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 07:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C435D16ABD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 06:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B59620408E;
	Tue, 25 Mar 2025 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DQ9o1pYz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C31AA7BF;
	Tue, 25 Mar 2025 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742884189; cv=fail; b=Tuv+n8T1LZq/CLyLJG7u9CDD3/UmxfZFpWj23Cc8+ghKJ2cw+zUKZICEZNF+E48eA0tt0/gM5AA122QspmPMmVEg3CU0w/h2kp+/KLypGM28kNgH+9zGNgWsGOW9S6IBlzj33iZXGBTUSO9aO0sNAy+0g3svGXNB0yERknWKh8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742884189; c=relaxed/simple;
	bh=eYtVpjQutgWKPX/VhTP58afraKR4Pm7W44Q8fFKg/E8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PWyOmh7yfbOOsvTkv5tF3WQvNnrxHndmCjN+htAhsLGddIJB4SBs5Hu9ChbbT4VN980a7Ewxp82esMH8qC/pTQ8JhSKJmJ0X7dDwMsthmVH0mVxNB0Z9NRz6lZOvBMlW/o6URe29zOKJd7L0NIAuXfT8A/8UQx3EqXFAxHw2uyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DQ9o1pYz; arc=fail smtp.client-ip=52.101.125.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xht3nEkVp1hbYRkE39dIT44jo1ePoIGyzx4xVxwZC9pLEaCX6gDdOJykjAk7dQiK3aCG9yQcvldcWmaDPyeZ/ZyPADtbUQYcbd0v1p7RqYKZXcmQgkjZSpxcKXFzvEKWbZ8/eHqhRaQnTCN+jUv1o1GrnEWqE28r1Q1rrSsTEs8iNSWAbHK6P3pO7U2oHnQRsb+vd7NUM1WNQhvAoCEcfaKNgKU33Xc0GESvM0zPhZanNUw/XkR6IpNR0CykexmfnHzEs8NQLyIXFx35Raqegrqo85c2RJLRsneBnNh67daxAH5qBvIAypHPX/0M/FIfvNUUfkvoOo83tx4AgVhICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYtVpjQutgWKPX/VhTP58afraKR4Pm7W44Q8fFKg/E8=;
 b=aCpetOGT6H8fmnj3fEJhzULyN7GQHknXX6GS3ZVNQrX2OKsAiEzlQr54rMncAxPrLi9RWqcXoYLfT/O2p74I401BXoJX9zCC2/z7TOzYcCSNn4xU/shM1KAsLHfjiqcA1cf7w2tbnH0kDQDDEamWrxfRxfjxwSaK97r0zqhy5Md00fjDASUYptSh/1vg+kfbGuBdV6npTg6g2czDS0HeeYjWSMSaLH2hOQkW8H0LPtbY5aHJY+9HTdMgFOmIMeTA0EC0ykpa8/TiEDnrDb0DVi8XTTkQSWeh/Gya2fKiCOVDZnBM+b0r6rZKn0VfzYbp88z6By78rRD5we55HM66cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYtVpjQutgWKPX/VhTP58afraKR4Pm7W44Q8fFKg/E8=;
 b=DQ9o1pYzxdah4VjDhlY+XYZHLz/Ut1URD3OF9oruZ2Dh5ZYDQgZBHOnIS2ra0pvdmDglvAvG69o8G3PHN6FvJa66QqOzQDJY+e3SXsAw91y4ge1WfgxnqYpIRJ05xQyB/2x3UTPES7MTGKY2QKXa5H2dn2I6zNjetwH8xhqJSyk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10434.jpnprd01.prod.outlook.com (2603:1096:400:256::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 06:29:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 06:29:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>
Subject: RE: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Topic: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Index: AQHbjqziDm5VnZMT0kiy+9hvCMHdZrOCJQUAgAA0DQCAAJjIgIAAju+g
Date: Tue, 25 Mar 2025 06:29:43 +0000
Message-ID:
 <TY3PR01MB1134602E988AD8428422E820086A72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>
 <Z-EpPL3tn54E8KG5@shikoro>
 <TYCPR01MB114922CBDC2911E2F644BDADC8AA42@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <Z-HVD6w6ivYR6pt5@shikoro>
In-Reply-To: <Z-HVD6w6ivYR6pt5@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10434:EE_
x-ms-office365-filtering-correlation-id: caaf7743-9794-4a3e-cfe3-08dd6b666de1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZSVSMtQVWVLpaBWJqAqJfDG6UjCKzUHNOa/1sjANugHQHVnctN50FDhdx49E?=
 =?us-ascii?Q?LZ9sBOK9PKZEX21r5AaXEBXiIY+aOHtnLCl8kQhubAT3GXyW4ffgF/gzgYyI?=
 =?us-ascii?Q?OfoteKt0R5hvoQ3G81tNlOPiPoBjdzyrUxKQdeo5/j1K4RA+CU0qgclZTAcT?=
 =?us-ascii?Q?d12McjmYnqVPkdTGSD6GpWooQgLexeCIPBpBydpuG/MIaX46JsWrnRj531rr?=
 =?us-ascii?Q?LZLTJF7y7rNKPWnNFE2ewGQZfE0Qv+RU1meEb1PRzp6O7ZSAZ7ZH2FsyWkq5?=
 =?us-ascii?Q?VZUclkcbE83KdkuFzAtjk96zNa1yspOPARXCx9bbOqsIqFalido3cTnLNwYy?=
 =?us-ascii?Q?+eZ8F+nL6Bi1XnKbdouKRgioCz1udUefEvaBFkfMM/p9/o04SeELBRRotuRY?=
 =?us-ascii?Q?h6E7+I1xT+nSwTIPQEXdsucabXPaAszqw2n8goy8FOIcbPRUmiQjomz+rl5o?=
 =?us-ascii?Q?zGCLcqfVIJlIBxlmeluDSKD4FBFuQ2jZQY3dOhgpR3O6nTGaNwC8uT+rgUiT?=
 =?us-ascii?Q?T2XwHwYrqHOV4FkMUBHugO5aZQnwdsDsB7QDLFeD64y/ds6hmelRvGnou3/q?=
 =?us-ascii?Q?DouN7GTsqWghzznADwsCg0kXtMqCxPojft5LGJ0IPSnLPjC443wvQKkZvcwW?=
 =?us-ascii?Q?DJkybcsru0DJKe+GJFzgPxXt8AnLAsVw0RUyv6Wtqnc372O6TLi07kCNhziO?=
 =?us-ascii?Q?h95lpUi1cpiX8KSb4znBBz+1mxvLbph8xqX2PAovu6Tm/Qb5C0AtDke4n2YG?=
 =?us-ascii?Q?CHjawKU2QWKPZ/5yxVJGnF2ZsMwj6WarN8VDrfg5ThNSaQsC79GH/hiPrzRy?=
 =?us-ascii?Q?270i5JNepuYpPQFXbEMLCjJFVED7gWVorR2RemwW4VTNHLuxzo7rJG+CXiH1?=
 =?us-ascii?Q?Rqu3padpyoADFowXBeHeKaM2kbn3LAbmCxr9v4YIFD5hOBwZQRXfuqoTXpdn?=
 =?us-ascii?Q?3ZQZtrHz/VT6gO7/w0SKtqr+garr1VX+jZukVL+o0CrIpRJ9BTauOKhYChxj?=
 =?us-ascii?Q?S/yfD+WDLcwvCz9j58KSVXkDgtK3c2A4hhkq0oCpj12wQ4Rj8CiDqbJsSmEp?=
 =?us-ascii?Q?Nt1cDcz8GRxl+O6jmojgHdMnIP5Q05nLI0kDoBmoy48nxul/MsSsaPDWwkWC?=
 =?us-ascii?Q?GK+673f8ChPQm7yVXwmgJER8UJtabvQnV0A7sANqyWe3y92Cb10bXjqllYy1?=
 =?us-ascii?Q?oDojKC9Xy2n5wYT8GjbOH7rQn4whS+dzTPkqT8ZfgkasKUU9GzN4sounxdcp?=
 =?us-ascii?Q?N7i1yl1E7b2sHRTRHHF5VBTrrgW6kk1AosmyKv6Aw4rCrE7inJrlTHscrBbs?=
 =?us-ascii?Q?5nCCHSeWxWjK48X+0z54B/3laiVtgqf58uUHE4zRDvVnS9881g7cFmYcLsYB?=
 =?us-ascii?Q?QnXPSQGDIBfAghjswQz/4yRXhsAJudPFxFjw5e89+uMaeQfmahXylVCctL0d?=
 =?us-ascii?Q?/KxKhcPDX/LnVIm+XAm9V5ObhvEjCm2Y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?u8vU7TWkvHZa/AeNlZ1O0lGFqne0AGbCe9tthmH3XSpiJEjS/1U8RxiFt9Bi?=
 =?us-ascii?Q?cMJJKMA1UT34VqlhJmL2uEC9Bh/Bzdxtp8EhEddgRNxGRVcaDsBJf2K/lX45?=
 =?us-ascii?Q?vmI75RNtBLAFl0xsfvhE6KmdaeHcFCT0LkN151r75AxKv4icH7UYi25e3+qD?=
 =?us-ascii?Q?5lgqRmbSlwaRtfJPlQn1IEtUAzQtfGKRF+p2t0vVrBmGInQjEXzXfHjjVlpN?=
 =?us-ascii?Q?Nw+bNSRRGVactqFz2x260RmPs3volPz/L+805rN3q1mcI74CUv4y/tjfesR9?=
 =?us-ascii?Q?let8kD3FKiKK9fPf3wGc+mY9hbKSL4+bd1w611WdCmvS8WU+pvPM2TuugxrX?=
 =?us-ascii?Q?Wmk9nZc2TpggFAaFiuEZ/2iJPiPky42C5EpWnEe6C45LTzM6DDLa8qIc7ppk?=
 =?us-ascii?Q?ObyPtq3KiOMP3eatAbgjD0/OBni2hXtTlYZxiWvBZimGJzT2kxXqRusLkQyI?=
 =?us-ascii?Q?vQWNnWE15wbNr14xB/I5Ui1D2s1W+SxG888AtKB21oSObqb1Oq9vdQu2b7Ll?=
 =?us-ascii?Q?VYFWsjRyqQPaOFL0fo7F+5gh5Uh2pDawPp/ZWEI3IY17e99zrG6d8x/d/TEI?=
 =?us-ascii?Q?wmArxsd5gE1KPUqlde9TRqzu2WuaRVplc03xV/e838D7C2I16age0wWPz6oV?=
 =?us-ascii?Q?VlLemogLsFYcOPk6E2VCF1fkZi81FxMLuwk/0flUvxix7/mUXIb6wjWfkp54?=
 =?us-ascii?Q?b9JpLbl8g+Hk2jyQkYFT+a3ZlJo5cXXhBlaP5maGQsbMygneY+visfvukWk/?=
 =?us-ascii?Q?WifoeS0TiBdLgsaQhbMXaZ5sJOif0lZ2Wo/0JMy7UEtzzs8xA8Gl0854rasf?=
 =?us-ascii?Q?EgADue9hwAxyFemrPTdYxM+TmdB89YzXCoSSsC9M8MB1ULO2gMEXcRq2LVpT?=
 =?us-ascii?Q?ZNPx064ZWLhD0zwbi5Zt9a6GodNXMO/JAiM3s5P1qq19BmCWp2p3PFhjr4tr?=
 =?us-ascii?Q?4N8mgkjH0tkoSPxiUM2Xs5+KysqMiHg3o+enL4vc/PldAfaVydD7/Uj527tQ?=
 =?us-ascii?Q?y7G5sAMVV6FXSugWaoWUa65c2yk7fCE+Ccen1ECrhWnKYL/rwVZQQcrxJCoe?=
 =?us-ascii?Q?vWtO+7nNQegEPEEcyooVKeZ6tFfvpXzGvhd6vslWfTH9wJohzrxBkKEYV1Vj?=
 =?us-ascii?Q?gcv8ql1yfUHCISihEVXJWUF9H5vR5Dyyjr2TNlQtCU450XKKtxUBXURxyTdy?=
 =?us-ascii?Q?b4hVDnvXjoHuTzX42MgC+uItVoXR9PEp7PrMHCTo0Ju0POhzsUGh6ugb5xzo?=
 =?us-ascii?Q?fmiMGvX4ExwEO+I9oKFa4xRhEuS04/KJ1kU202BWoZ8FchOF4BtlDqAzctxb?=
 =?us-ascii?Q?NkfxjydCRDZUTJHLlKsR5Fad0tWIwkSQM/IIlwlHRs1H8kOUGbRdFydKYTmp?=
 =?us-ascii?Q?pogsJcGx+PMgueCM3qn/GS+ciFJh0IS58/LpNIfj/5EVOju+AHdSp82auJ4G?=
 =?us-ascii?Q?x+kX7exp6XpbRd1lOY6Zh4TSotnml9AAV3mFQGIsc+71xAFWarhGoKkBxinh?=
 =?us-ascii?Q?7sgFPZL83gP4GU6VPOqjKWFQPCNEvcSkzpB3kWlfRPbTnPYOc6vE2pHDZhDg?=
 =?us-ascii?Q?7sJVzQ3nE8zECrFE5ZSARjqgw22lslWJ0xUzALKwOWNy2WqSsB5OTv/5gDtH?=
 =?us-ascii?Q?IQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: caaf7743-9794-4a3e-cfe3-08dd6b666de1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 06:29:43.0320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tdunX1suAa1o1t3yWDQaSbvIM1dlEZ9HVQ87j41o0lgoGNmo+8k6xV55qK6ldxoLT5xhhOqWxRzLS2kzaoQuaOFvl/jGnVqXAmRmeYDSH6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10434

Hi Thierry and Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 24 March 2025 21:57
> Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
>=20
>=20
> > > > +config SERIAL_RZ_SCI
> > >
> > > I think this name is too generic. Most RZ-variants so far do not
> > > have this SoC. Would 'RZT2H' work or is it too narrow then?
> >
> > This is too narrow, because for instance the RZ/N2H , which is very
> > similar, has the same SCI
>=20
> You know the differences better, what could be a suitable name?

Please consider RZ/G3E and RZ/V2H SCI as well as it is almost similar IP.

Cheers,
Biju


