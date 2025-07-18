Return-Path: <linux-renesas-soc+bounces-19589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3DB0A66F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 16:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEEBF7BC47D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jul 2025 14:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8362B2DAFDD;
	Fri, 18 Jul 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aEYsXffr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366212BD590;
	Fri, 18 Jul 2025 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752849399; cv=fail; b=FpRkRSrbxZ5AiDi19XhksJim9OCI0TDNm+nBFdF2+17FeJm82FNppnTXOGb/QiicpT2yWdXqH7VCGnuWsZWM9z6jHpNF5Q2W/kCidm9Ehc4Otv8cueoVeLsBox4x/BZ3v1M4zgOkDKg21qc8LtM3bT4Efh+jKoMReO8JvlwKvus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752849399; c=relaxed/simple;
	bh=T7KYo3K0ZquTkcHfyIH5cb4DQFkLN2s9I43XfT1f77A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yic1tDYrQR/iQbQQXGYKFbqKlulPVOkFLSsm+ba1tZm5ySxhiTXZYZdEfsqyUmh38SuJnZSMSB0d3CS1VPAX8h/KxjvonRI8xBBtEQu9BTMwEQ+auNTtNseePpeUmDIW8p7b7f/3v1uJ6+7QuVmf9zPmOCFfHSZESjk6elWxOpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aEYsXffr; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7dsR+GnccFy+t7l1/Ceje8/YJmyGJ/Nbux203jB1j5lBNkq9dTHZASIACyc6QVksA4azaO6yZUXEDNYhN0GIAEg16awPaRapJcbtSX59NKDC8gr2/c6baZENPmmce/A+F9aUTrzPeLelkn1IoF1TxR+C8ydZyDlOFylZtRcKklkWu8LV3eeoJzCwjNneM18lQmmNRXbbGBEEKWCqupx913GAl/ZHfJdq1RnjYLoa2SeN9k3d/jw6VmMtdGYlXlSWVcbXONL527+KRKVlaPZs/B9SGvtReKPjSYVpi+TLl9W+ABIK2bDwmoTy1xNl0ZkCVQ1eX+PSQG1REGhSkD1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsT0QTxuPDQNUj7fnQLfs5K9Sv3VJAiTkOb3BVDDQi8=;
 b=lE/XA/YlQQ/F3A+As8+BAUodmwS+kgAC/qfnXMgj+YbZ/DOZjZqqkB/IAe1CfWVK/di9+w73sJDa+ZMFPJRFbS5uB8dKhSnhC8SAyGqrYweR6ny5FbkviJDmUI2tva0QOwz9lqMiXbEjyeT9iatd64s6EbXEUMBXDLdL9nhVwzrEb3SP5rIYbM25ySCxnj+B0dyLYM98orPLEGL6xvS329sEMQvMdLgmHpziH5rGmAzDiKIoVD6bxmZZsCd7Y7AZ1jD/2rIr6q4zEXZhGvCFMf47WztUScWw3ZZdcVCC+zLQaLIInoKniUdwZLKFssU56Ttl16YPlbEoQyYf1B23tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsT0QTxuPDQNUj7fnQLfs5K9Sv3VJAiTkOb3BVDDQi8=;
 b=aEYsXffrJ3GaFU2jc7kWWcYKt+FvxoHC/YkpOcMTHax/YRm7PoKrhJyQoIY8PTtC67Ub+hbEDk1yWtMonA9dlEHRkvQEHBphZgLo50Q85Xt6vS3bmKbGTIiEBvLD7oRior3K3wMcKt+TIJK0iB8O1J9iwALvRpXO8MO0781vfRH9dToha00KQwsVTMlk2UEYU0czAE9cOqvK16yZHje9Stb3/clClGJ/2z1yC/+srudI7I2sBtsJbEaDNfMsFoWAqSv0GDTBRQKDiP2mRu1JFPG/I7wbEFg3eYab0anpEQpYRAMDVpr1YYyWgqEOd+CrPpXcz508tVQZm0B/awwh+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10530.eurprd04.prod.outlook.com (2603:10a6:10:55a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 14:36:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 14:36:32 +0000
Date: Fri, 18 Jul 2025 10:36:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i3c: master: Add basic driver for the Renesas I3C
 controller
Message-ID: <aHpb6rSpxOv6oV14@lizhi-Precision-Tower-5810>
References: <20250717122455.9521-1-wsa+renesas@sang-engineering.com>
 <20250717122455.9521-3-wsa+renesas@sang-engineering.com>
 <aHlJ8KQzcamyaZA1@lizhi-Precision-Tower-5810>
 <aHomfzV_dJMwFyCN@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHomfzV_dJMwFyCN@shikoro>
X-ClientProxiedBy: AM4PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:205:1::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10530:EE_
X-MS-Office365-Filtering-Correlation-Id: fc28a77b-c662-44be-be70-08ddc6087d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jUPXUQbtZaksBqRR+S2mHhrAatdfUoNBFD1S13Xa1H+13M+qbkJYeI8FEN/u?=
 =?us-ascii?Q?BA/T53U4oYkahSYeGGtIWEMeOR28lU98dGRElbJerKmbFu4k5xXO+CwDzBjJ?=
 =?us-ascii?Q?ZRSTZsjAEFIvi4k4sqXiQ/lHO8Nzd0yC1y8WV3BcYrcmYaIEbaKxcDWCTh1G?=
 =?us-ascii?Q?I1BN0+SdbMA2XdxUKx0HAOiHJlxWmitnNooeV50eI8BecFKG3L5+xfVSFkDm?=
 =?us-ascii?Q?U2STpAeZXDbWikCVZUS0/v8Fvk60U+S3ocEy+5S8RZVWk5yff9P5U6jh3rYG?=
 =?us-ascii?Q?VhSOCvhIiEqbFX0SvXcOl3svMnERFIccvggCF8Auo3ez4Il4OeSpmgLnnuL2?=
 =?us-ascii?Q?vYYtnbu/Do910P4JvHdvhnfHDq3hZA5UHmo50/2clATfH2OETFv6W3kEUbCb?=
 =?us-ascii?Q?+Dm/yTRGNSe0804ngOQYcnnx+Y05Tfk4ThewewVghXadi6HT3MNWgfp1Y5QQ?=
 =?us-ascii?Q?cMXDSJO8TJkwBBMyCUZ7oHWSXLIEnmhhGjicDroRmZTaxlpVWyvfx4UT6WDq?=
 =?us-ascii?Q?coB3fKFazEObDx79mC9xyjtAlaAniAv+hmhBDXyEFEAn2aM49iQB4yUcsmAT?=
 =?us-ascii?Q?5F2Azsdj9j2o/L1rPWopYm7w+YemjuVwQW4nVZ9NaJuEiOMN0ZMO7UYrhErc?=
 =?us-ascii?Q?2X3E8XcZva9hcAKWr0wJtzNkUkR+pz1VcfJcdmuhj5dc0D7W4BpPP4gG+5fE?=
 =?us-ascii?Q?Li7SX1BB2lT/4mPc4/ebZug40WvDMlM7YDAZ1WTs3eOf1PCr6+q1VJU2rlfP?=
 =?us-ascii?Q?UByOMce+DC6urRjgSvpsy21nwCxFD/JqjcsmRCU+L7I/pOLc6lfTsNbPhfzZ?=
 =?us-ascii?Q?5Ous5nCdhbAzXofAwI+1PI6tEB/SPuWcoevfoUy+TYtG5+rY5ZQss4TeTR9i?=
 =?us-ascii?Q?IUg+s5hyYlgBsMjKoNTr0vi2ciCUzB8E92mxFERRcFwEXBqksUTWz3OGxLiO?=
 =?us-ascii?Q?rsLWuaXgRZFPzvsqRJitZ/tho9kgayrUfdobmqkvX6ECQbtI5nDYgWEdQGd7?=
 =?us-ascii?Q?VFTK+JUKLjd6orfHacUYmKATOUr3Y4T3VUzCkK5o5uAwB0Pnuch60dtMmcv6?=
 =?us-ascii?Q?fiF5eerDQgh0lyxKUj6uIoft78SySM43/pbeGogS1Mp6Y3rApg+IJsBEJJMC?=
 =?us-ascii?Q?AHbiSbQw89cPPb2RtecZgmZofA4xIlTVt0SSbr8HbK8/nyse8N87u40xAfiX?=
 =?us-ascii?Q?sZAH6TDD8JSSWfqU5G07z9AYYe0Z4NxjdC6bL95lmKOkSHCUtvCAxjSqpmIs?=
 =?us-ascii?Q?O+c2+gY9xCeGUnjiM2XahgLrohaT2qQVZGcajwW7+Mq6M+MwKr1nBwA+LkON?=
 =?us-ascii?Q?vbJZd/3yjGBvBRgNuWNatpIYGdJ3jomN1goGjnm8SUsATYUsIdLtTUUCrMqI?=
 =?us-ascii?Q?yW+Nnb9xMdBtb0OXm2XN3uSagKG/wiGTJDuoISeYjyeVJcMFozkDnZTYHXJR?=
 =?us-ascii?Q?rUe2Dx+SAzI4FK/Ty7HyNEYqqDd1XvPLS22WiYv0cdq07OxG39xNIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p/aQxh43vIcKhgDjnLHps3CH0YDdB2vc3tcMg4N8mKnTC+C2k+5+QxD2o+y+?=
 =?us-ascii?Q?mQz54n4lqXT6qY3eiWKnxdFXUxbuU2LVA3xRU0BcejF8Ucxdx36UNSs/Z+HS?=
 =?us-ascii?Q?sgTTbXk6xssyj9ywRxobdsUFibXVQoJg0LBbpLJzbLI1hxiLgQBpEEAE+s7z?=
 =?us-ascii?Q?M1kHLVAYOg6uReCrQOkvCQ5+ZmH/D5H5f6S6iAsYW4qC+/fGqMlr0N10B+Rw?=
 =?us-ascii?Q?Z1wSQePsxuw+naX9mL0bzA/PWQJKa12LoYr0z5r2r/Yc8S5Qq1cC0QXaKr/f?=
 =?us-ascii?Q?CXVsVs2mDZyRHQjBqhUvok+9iSkSiTDHK1ZAQIipzdWUKcWs5oGHEMvgZfTy?=
 =?us-ascii?Q?9o9uO47i0ZGnMo3ugMWX7kl5o9j97lfUzU3/k3cxbiDSpsivYUC+1DgGzN4y?=
 =?us-ascii?Q?bIugSdwrAinCnHw0zUCSe22tpROfge26XN9kPGqsGxkPjggDCw0u0LT3yEcs?=
 =?us-ascii?Q?i3WNT0IoauZDQVMKPY8wBrS18JeOPzRWrLtqSlub4VeuyD95KUUQsKE1UZa0?=
 =?us-ascii?Q?Z12Yn4vkmEbRQwdtkS02C2wh1gMmRVrHK3lOtluvXVVx4HO2WJeGjvPi6U0g?=
 =?us-ascii?Q?3sUzmMfcwTAuJ1q0AEFtiD7rmFyBTLpl7e4DZs8fBqP+2tNB9Ij7zT1I/0bR?=
 =?us-ascii?Q?eGtB7CNW4ApeeXsAhCGIRuDprJdcdvMTuD0al8BkjwbZX+os+pzr1xsNQE/X?=
 =?us-ascii?Q?7J64CbJW2+C4HMFSM5oyETbwQ9FDnn1rCPaic91yvdLazHxT+/78XOOdzIvR?=
 =?us-ascii?Q?3zD4jrhJECvUSlPfKn1PVNsdO0aAMMm6WB3uVlsDrv/0iZ186spVU6+nJod3?=
 =?us-ascii?Q?/FqfJ0hE+8YymLDhxzwWYxn0iXA02GBD4WEkLo6uMX/490Uyg/hdiSujW3Bd?=
 =?us-ascii?Q?edLVkfUb/4AtsG1bxdB6TA+Gn1rD6TlmfzCPTqr8i2dBcOpLWsYEUe79oarr?=
 =?us-ascii?Q?AWKTyGvDQRNUoFdF1X6Urh9yHPbVJcsrhA7S0Eb65ENbQ5oUzOFEPvIQW/B+?=
 =?us-ascii?Q?6vawuIZc9v1KIKm34Xp3SOndRU4ZAbMUJvhZWT9pRAN6Sw7cwwWATsoHOp0A?=
 =?us-ascii?Q?5dd+eTnBWmEN8T/dqctDGk2f30N6a10KpPoLcUD6WGpoPNtUpdCkTxP3Sog5?=
 =?us-ascii?Q?kxOWsmWyLNpahVxpnEl2L6hEfBCysRgqTF2ok/CWq2qe6Pumt2wdAv3CBn/O?=
 =?us-ascii?Q?rnQhKksIHcwpJkbHpM4jp5qhgqSGe1frWLvmAd5438SAB0LGlxkeDzxAr0aL?=
 =?us-ascii?Q?3PKTlfkINslMmUR28Cinlt+6cXt6onodiT78RwSS6bw2w5rnyn4XlyAzJEk/?=
 =?us-ascii?Q?mR+qTJS0wAEiABW0MjAYMxstii3WoeEeHQW9MP+rRNl1P9Eb+0dFvS4HjO4c?=
 =?us-ascii?Q?zWm2obhbbfoehCWMqg6mHvlw4lw3X2KFGfEVPAzeD+qZLLmWELjeDQpTzknl?=
 =?us-ascii?Q?TDlVB/lwGzukb2nDrvtKXKmGSSVmwsnQBW75x+Otw53PPTaaNK+PsYZaCHPM?=
 =?us-ascii?Q?yuNx4oWUlWGf9EjXV5kXazBXFFb3XJ6wsFH/haNDdx4V4LOqJOE86CsXcqh0?=
 =?us-ascii?Q?+J19XVnbuNjFYyzme4jK6naBN+lV8mPL1SgdI4/J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc28a77b-c662-44be-be70-08ddc6087d81
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 14:36:32.5917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpMfShjWMlLO1z+Eo/QmErFspz4NHZCbJ0X2y+Ji1Wunc1H470v8oiJNhHJXMFH76r42Lc/2m6Xx92qXiwtZDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10530

On Fri, Jul 18, 2025 at 12:48:31PM +0200, Wolfram Sang wrote:
> Hi Frank,
>
> > > +#define NDBSTLV0		0x398
> > > +#define  NDBSTLV0_RDBLV(x)	(((x) >> 8) & 0xff)
> >
> > Can you use FILE_GET()?
>
> You mean FIELD_GET? Probably yes.
>
> > > +#define RENESAS_I3C_MAX_DEVS	8
> > > +#define I2C_INIT_MSG		-1
> > > +
> > > +/* Bus condition timing */
> > > +#define I3C_BUS_THIGH_MIXED_NS	40		/* 40ns */
> > > +#define I3C_BUS_FREE_TIME_NS	1300		/* 1.3us for Mixed Bus with I2C FM Device*/
> > > +#define I3C_BUS_AVAL_TIME_NS	1000		/* 1us */
> > > +#define I3C_BUS_IDLE_TIME_NS	200000		/* 200us */
> >
> > Do you have document reference to such timeout value?  If it is spec defined
> > timeout, please move to master.h and add ref to spec sections number.
>
> They are all in the specs. Will move them.
>
> > > +#define XFER_TIMEOUT		(msecs_to_jiffies(1000))
> >
> > Is it engineer choosen timeout or spec defined? add comments to show why
> > choose this timeout value.
>
> Consistency. All current I3C controller drivers use this value. If we
> want to improve it, we should do it in a seperate series for all drivers
> IMO.

You can put it at your first patch. Then your driver is first user.

we can create new clean up patch for other drivers after your patch merged.

patch1: Add standard TIMEMOUT value in master.h
patch2: binding doc
Patch3: drivers

new series:
cleanup other drivers.

Frank
>
> > > +	/* Wait for reset completion  */
> > > +	return readl_relaxed_poll_timeout(i3c->regs + RSTCTL, val,
> > > +					  !(val & RSTCTL_RI3CRST), 0, 1000);
> >
> > All you use customer's readl at other place. here, you should use
> > read_poll_timeout(renesas_i3c_reg_read, ...) to keep consistent. check other
> > place.
>
> I will use regmap_read_poll_timeout().
>
> > > +			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_NS,
> > > +						     1000000000 / rate);
> >
> > 100000000 use NSEC_PER_SEC, check other place.
>
> Ack.
>
> > > +	/* Extended Bit Rate setting */
> > > +	renesas_i3c_reg_write(i3c->regs, EXTBR, EXTBR_EBRLO(od_low_ticks) |
> > > +					   EXTBR_EBRHO(od_high_ticks) |
> > > +					   EXTBR_EBRLP(pp_low_ticks) |
> > > +					   EXTBR_EBRHP(pp_high_ticks));
> >
> > I feel renesas_i3c_reg_write is too long, renesas_write() should be enough.
>
> It is long, but precise. renesas_write() could mean anything. It would
> also be confusing if some functions start with renesas_* only and some
> with renesas_i3c_*. But this is already too much bike-shedding for my
> taste. I will do the extra work and switch to regmap and hope that the
> overhead is not noticable. I hope I can squeeze this in today.
>
> > > +static struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
> >
> > const?
>
> Yes.
>
> Kind regards,
>
>    Wolfram
>

