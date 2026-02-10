Return-Path: <linux-renesas-soc+bounces-28115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFbaE/YVi2kSPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:26:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E811A19E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 037CC3019539
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBE7320A22;
	Tue, 10 Feb 2026 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OZxWYHtE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8493191D3;
	Tue, 10 Feb 2026 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770722799; cv=fail; b=hTuBaXzCn52V6h4wT5ytIqUIQ1N6TYyoa+68rlpG8WUOqH4casjB4oCjgCWGffYZdw7dfr5FX9YjoINN423RWlOUFs3j09SuLqTlZnkZTrAFHjHUltKPZLP+y72GGqX1ETuki5PEwb/VJieuRT4A4NwFu/fBMxuxQ48IEF7VJaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770722799; c=relaxed/simple;
	bh=Gvppm8oo3+aKFSGeZZOm0KLujcmoRrfYT1DUFVizL0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pxEPBual6j1JiAzy5KRBquD5n9LPRMjN1AXKnDdoFNoQYn1MmudfBq9553DkVfghDt877tmG9c4lYJiaR6qz6gg3qh73hDPA8fNTpMmopqSfszpBONT8+Qh6V4CEgDZqiRJU5SL6hlPOgRHJUEWsEZlG8dmzpobQjIjsgJNQQUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OZxWYHtE; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVmW/hT4bGqof4yP9ALFmTnCWCbjOPgs5xF3/urw5a0U4Y6tddQAtWSyWdzly2yQCczyxYUZYuAr2pHDQt4HnDS/g/hzH0JcyHAfJSUSQICmjhNC+O6AjFv2VyJ+BNnY+Me9Z/6EIBuAd5jW5AfEZ+EshsFptWMzMxmcVljk55XExmVCyPgo4YG79y2bXThhVN2J4KLlocTGALZ86ElVErtv+aljWtkvKXFqnRjba+aIr9uyuAJUWZn6ze21L38brCKZWx6q8LdHa8R1Fnwg+OZ/0Rcvar7x86ugMmOvKY6HxCuVWNQ8c2WeAJzdvFb3y0DwdeFHXhk1LNCf9g/iIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kfdk5YVJ1f5VB98HlAaaTuu/uEaZU4pN1aUym0yrmkg=;
 b=uxO+xtwOg9gLCeomQAuTBH0a67AuHgVXNeazE3ZlycYPKXxChpyoaQz0l7Rmbh/yTbdHYpJXM8pS7yeCPFUmvVfjbRmqvecwqydIeloT2A17xHZpELwK+HNrsRk2HdBB2b08JDa6vqBzCet2Xl8DTmGKTcCq1ZLsmED1RU2bH0AtW62Y3nBaSjf3ug2aGteDZj6beOh8YgKGShNZUFqLESdf4B3r3DEty1PYZHrNFaeHGhrntTFa9AhkPlt7+8O7RfsnmKoX5TIHVYJp9wThhQGuvNBKMicqCCwShvAMa/wD5KBNpi7YhyfBFwr3QFsT7USzaoI/Lsk2DoArRktexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kfdk5YVJ1f5VB98HlAaaTuu/uEaZU4pN1aUym0yrmkg=;
 b=OZxWYHtE1Zv9HcBs5QX0hhWwW59f2BD5Fzn8bGwZZ+3RqOLkHrVrS/grfUWW7uDAsK9ohUw8gwJEDgvM8IygbD/JXhrYF0NX62QzsFWmsIz1WpF40vpIxHVr6FsGbhF5FCkDDLpp6/MnDYvLFSIBW/VSAH/u5xeLPMagTXH/xMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB10393.jpnprd01.prod.outlook.com (2603:1096:400:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 11:26:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 11:26:33 +0000
Date: Tue, 10 Feb 2026 12:26:05 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] phy: renesas: rcar-gen3-usb2: Drop local
 devm_mux_state_get_optional()
Message-ID: <aYsVzVICB0kcM7lw@tom-desktop>
References: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67c8c4f9bf9f09fd0c13daedef27b82ff389ddfb.1770720452.git.geert+renesas@glider.be>
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB10393:EE_
X-MS-Office365-Filtering-Correlation-Id: 1223861a-f69f-4245-dcc6-08de68973e66
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzNwbVJjMlBmRllNWDhobzBrREp3b2E4TkU1WVNIMk5mcDloS2xTa3JNc3JW?=
 =?utf-8?B?S2JEOVlRSzVHVDJteGVSQmhMbzhjY010TWFDNE5YMVF5RldxbTg1QWlsdktt?=
 =?utf-8?B?UHBvcHJ4NnNOZlpsa3cvVThkODVRNkhjSHVBQzVpYVZMN0dJdzRHM0NIYXZV?=
 =?utf-8?B?aGdGWnhzbmRyc1pCbWFMUXRwWkRNcGRBblAxSW1uMnFKc1MrMlIvUFc4eE1B?=
 =?utf-8?B?Zlk0M0ZUV0JoN25VNW9xQzZhTHBIdStDdnNoZ2Z6aWVVK1JLSDdZbm81RVE2?=
 =?utf-8?B?Z1FMc3o4OUc5M09aYzFBRDVIWmxsMmZWWURLM24wM0hIclRVSjN3dkxIdzdD?=
 =?utf-8?B?cHdycHhHTThYNUNYbmlXbGIwRkx1Q2R2Q3lyRERUellnYlBRVitmZThZa0Mz?=
 =?utf-8?B?MjhXSndpR3l3M3JzVmNnUG5MaW9ud1o2K2wyVEFJRzdmdWxPN2VjQXZGdWto?=
 =?utf-8?B?Rkt0L1ZhYWhhdFowZWdIQkp0eCtDanNoWTRXSlp4cTFyaVJUQ2dpVy8zcmtQ?=
 =?utf-8?B?WmU2RjhLb1Q2SjRqVEhkSDJva1BmdEhDekpVbUVCT3o1NWJiUU03V3BoVjdK?=
 =?utf-8?B?cUhVaUVJMStEWGxPV2hMRHhwakRDUzVPVmRHUnZEVUJRREg4OEVvbHRKZXFM?=
 =?utf-8?B?cVZNQlpmQ3l0U1I4dlI2S1JtOWdYL1NISlFUWWdwVUc2cnF3RjBGdHc5QkFO?=
 =?utf-8?B?TTcxS01iNkNncGtTaU8rcGE2eWZWQUJvK0xZaWRySkxQTGllb1ozK2Fuc2hY?=
 =?utf-8?B?TTF0dkYzVklyeGg4NEJUSCtORU9UQXdZZmpFOEQvQk93eHQ1T1RjV05QUzV3?=
 =?utf-8?B?eXNoZ0E0MkxkS1Q2NE00czhwcjI4bDhFa3pCRWJrcDVVWWpRNmttelUxVnc0?=
 =?utf-8?B?enJ2cU5LM2kwSnZScEJ5Zk5FenNhUnJucDJzUXhsVUthSnRsbElDVGRjbE5a?=
 =?utf-8?B?bGQ0aVhOM2F6STZnNjIzT1J2QWlTY05MWGdEUGJTUWMycURSakdTLzB3OVhv?=
 =?utf-8?B?azg1cEk2bUtmaUhPb3dNZk1uZGwyUHN3Q2wvYXRqNkpPL0drbDV6TzRwcmcv?=
 =?utf-8?B?aTFObVh3dnd6cFUzWVFtMXdlemt4RndzZzNaMjhXeDdjclduSkhyVDZGazhB?=
 =?utf-8?B?OFVFVlUzMWVNUU5qaWg3M1Y3UHd6RTU1R0hHd1pkNWxrRkY2dG9EQUwzZ29z?=
 =?utf-8?B?L2ZYOGFLeHJaUEFzZzdiNkovejJVVUJwcElpRzJnclE3S1NsYjZ4MzR4WlZq?=
 =?utf-8?B?UDlja0pnZGVxckVvSDhzTnUyaXQ2b3ZFKzJKNStNd3gyR2ZtQ0xiSzFuUmsz?=
 =?utf-8?B?djF2WU5SdnZrYXJVb1RUcHBsbkdoM1Q3TVNaeWdsQmRMMUJSdXgrTWxRQko1?=
 =?utf-8?B?SGtSYmZvRFhONDltVUtQVithMnBIMVV1blRKVmJ3QXd3VkhOYWFGUlB0dTd6?=
 =?utf-8?B?Y1R0WGYxbE9uVkhrWUhKQTNRT2JUNGQrV0V5ZGlSSGxLa0hTSnU5SGJSakc4?=
 =?utf-8?B?eGNSWTJlTkwrOVJyMGpmNmFyYUpoUWdKNElhRVZXbkJzbkxUNFhOZXM0VlBI?=
 =?utf-8?B?VmhRMnRTTDRRLzdDS1lpbUlXekxzVXBNejYwZ2dkWVloZmtDTFVxcnFZWC9t?=
 =?utf-8?B?SlNtczQ5b3ZJVnVPT09Na0VpWGZZdnJUTTRTMk1aRHNETDJjdFpYWmMreWlw?=
 =?utf-8?B?amdpU0hZd2hCaVd1ZVBUNTBzTUZsSU5IWk5qMlR0bktZdVBLdmN3U3BFQUl5?=
 =?utf-8?B?Mk9obTBsOExodTVpRk1UQmExTDVWOG5EQzJiaUVZV0NhdUppNDlEL2Nsc24x?=
 =?utf-8?B?T0lJbXZwN3lZMTRpU0FBODBBSElYZTdNQW5CNk4xZ1ZnUXl4MmFQSDBob09G?=
 =?utf-8?B?VUdaMndWRHAxMzFmVnB0dnNXcDd6alZzcnhHeWJoNEtwOEhRRk42K2RkY0l0?=
 =?utf-8?B?dTdKY2IrSVpyRzBqUnM2d1A1bzljQndEbTNrV09ScUpjMkxpQWtlQitzRmcv?=
 =?utf-8?B?aGhqL29YNnl1VmpXSi9WSC9EQ2RuektmMTJ1dnR0TEhwWTJyT3N5STc5aUtL?=
 =?utf-8?B?ZlBpK21MWkpJdTNRV20vZUhQeUt6VkhKTldiT3k4bVVqMkE0Si9EdFdLT2xp?=
 =?utf-8?B?VmtSc2dCNHUwTHVwQVRsNVhsaTN2Y0FTL2VYYnZQNEo4dG5mdXJremthWVBC?=
 =?utf-8?Q?WNvKV1ZDHyGiru4/mc4JvxI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHhLeGNFTHJna2lFV2l6aGFQOGxGZFQ5V2Zlc3Z0akJiRmtncnRwdGY4SlI0?=
 =?utf-8?B?L0J0NVhDd3pWb2U0Q2d6MTNldXdsSHllcUlvUnJVSVZybnJKN0x4dUZla1Y1?=
 =?utf-8?B?Qlc0enlzSnpoNldSR1BwRUlkS0hXNnNUTjNnTUVvNElNNnFyeitVanRDRGpy?=
 =?utf-8?B?TlpERXhldzE5cGl5QnJDL2JUVnJraW9lOXE1U01GQkV2eFdIMldiZUFTVG5s?=
 =?utf-8?B?ZCtMYkZjSUVwcmFmWlcwOVIxRHRKVm9uRDh0RnZsaHJodXc0OWROS2p2K2JW?=
 =?utf-8?B?YzV1N2NXVFhsclpYc0hJODBsakdFQ2FnWUtxUXFFeExrRzhML1JBNDQ4R2tV?=
 =?utf-8?B?dTREOWg5STZ1L1lnNVJWa3pjamtEZ1VQbGRmak9JM2I2aTZERUdDcDlNMmpa?=
 =?utf-8?B?NDM0MFgxU2Q0dHErYWFvUVloWTFseVNIRlRxZmw4U0d4amk0U2hMMnpOUGZz?=
 =?utf-8?B?VjVVOW54bEpwOEVGVmphWWxjZmp0a0h0WnZ6NVJKODBNOTFhb2dHUDNjZWpx?=
 =?utf-8?B?MFMyb09VVFBic2xVbk1GTVpPdW14UExUQUw0ZGwwMk4xb1VVemh4WlVBZ2ZU?=
 =?utf-8?B?VHp0LzlYcU1qUUtSM0hHV2QvNWJoUmJ2eEs5MkRTanVOa1pGNFpEa0JhTTdK?=
 =?utf-8?B?dGphMlV3Z1EzNWY1RlBIejM5bzZmUlQxUkp0UG9VTVRmUndTMTdFVmZQelNl?=
 =?utf-8?B?aXI2TnNWQlBZMm5iT0xXbDg3Q3RpTTdxejMyeVd2NUo2M3hWcDFBT2lYMG1W?=
 =?utf-8?B?SXp2UXJYc09xTkd2L1p5YTRwRlV6RUFDS0R0OGlEMDZ2WEdjbiszV0JYWFFi?=
 =?utf-8?B?Z1huOGhKMHNIdlhtc1Y1NFNNUGZ5eXV6TkJxSjVLdmpBaVZYd21COFJ0dDRv?=
 =?utf-8?B?TXN2QXk3YzgvUG9XNHhQbFJJWk5sS2xvelRobVBXc1JTKy9JaW1LeUFVVXcw?=
 =?utf-8?B?YUN6d1N0UGZYNGRiVzdCM0NOb2x6SWJsT3BQRnFMb2lkNCtLY3h4TnJiU3Vt?=
 =?utf-8?B?citPT1hYcEpld2dPZjk0eXRvbjFSSFYvZzAyS2dSSnJzTW5TdnMzdm9VMm5m?=
 =?utf-8?B?TThjTlV1T3NrZ1FyMGJoelJWbitORWJKT2pXTEhhTzQzTmtjSUFISDJtNUVL?=
 =?utf-8?B?TjZoRHhTMld2OWJheFlJTmlGZUtmODduSEZxbCtkc0NFeUYvRzFZWlBXTTln?=
 =?utf-8?B?SklWKzVkRlZSWU1xS1E4d1AySWNZRFBuNklRc1NjdFROUTBRYmtGVW5CY2V2?=
 =?utf-8?B?L1dBR3daZDh1MzJEWk1ydVNjT1JOVElJZEJkYXg1ZGRpWk5vYXk0eTltUmNN?=
 =?utf-8?B?a2syOUlkUlpJNGUrdFJ5aUZIN2pYZVRhUHJuYTU3a0Z1YVdsM1hOK0lOQkhl?=
 =?utf-8?B?NXFDMXpVQm5GRFgrdFF3V2xId0tjNHVoUnd2R1dNdGJGdytEMkpNTm1WVHla?=
 =?utf-8?B?bm0rcnZVZkxDMHVYQTUwNjZoQzFFb1BNMGdqdzV1bVZkMXpVdDlWL2ZTdHor?=
 =?utf-8?B?RnQvSVFXMGxsUUtNUHVacnd6WE1ZeVcxRGR2N216WDdOeSt1Sms4RWRTTzdw?=
 =?utf-8?B?QkhHMUhtdlBmbUI2c0hDY1d2bDAzS282eDBPTlZveUhwdVlQNitvekpabi9v?=
 =?utf-8?B?V1FyMUl5ZzFNenFwdUtXNmZCLzZpYUVycnRPTFl2UWpJNEk2UE9PaFYyZkln?=
 =?utf-8?B?VnZQNjYzUFlUUHFTRUFsckNRZWVYemNrRTYxclpWYnlieXVuM3ZXRjdwZ0w1?=
 =?utf-8?B?VTYwNklITFZEUTFNc1E3YmRMcXl1SjhSdjdnNENlQ3NsdmZwUkIwWCtUYThv?=
 =?utf-8?B?eVg0UHkzZkRRYkRzM01aMEIySFdJOXBVUWVTNkhLQnBVbC9COENLRzBGdFcw?=
 =?utf-8?B?VTZQS0VKYXpXY0dCbUJGcTU1QzA2dDJLVlF3VUZCTzVhUnJJUHZHVjl0cWdM?=
 =?utf-8?B?N1dYZVNvVmdybGRnb2RBRWYxaHIybVNQcXJiTG9PTC9LMStmdTZSWmhVN0RF?=
 =?utf-8?B?S2ZQS1F1Tmx5S3cydXB5S3UxOVNlbjVDQjRrcVN5ZW1YZkhVbW1HNHdBUTJC?=
 =?utf-8?B?OG5PUXgvOTN0M2xkMFVCbWhTR3VxOUVhbUJHVk1RcUR1UFpZTDloRWRxaGJL?=
 =?utf-8?B?VWdqZUUxTVA1THNkQ0o3cjhWY25aVEIwRklBQ09qWFJKRElUS0lpd0N2N29i?=
 =?utf-8?B?R0UvYmtPVVdJQWlUc0toZmNwaU56UVlYZXYvNXV3K3Z0emMrTFk2UmUzZmoz?=
 =?utf-8?B?blZQaktwV05WcG9ISjd1RTlsU0hQZ3FPZVA2d3puNkc3YUJrRzlYUEhXQW5Y?=
 =?utf-8?B?cTQ4a3pOSzh1cnhPYlVuQTJ1YldrWktGTWt4VkNad2tjU0QwWG1IT3pFRURj?=
 =?utf-8?Q?xhXGEkSl4s+CZ8JvcwrHTFlP1PiuYt5SED1+1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1223861a-f69f-4245-dcc6-08de68973e66
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 11:26:33.1201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BHk7Vg5xmwCvzQ3XUNSKOXvbsGvOFKukc+1Lr0pqd6G1fVZsYANe1HfLpnRywddFsm+C+CK+SfYPQnCaa0K5fdl1raMuU8Frtab+usYjN6iFxAf3XUNhg0GwysdGnHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10393
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28115-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: AF9E811A19E
X-Rspamd-Action: no action

Hi Geert,
Thanks for your patch!

On Tue, Feb 10, 2026 at 11:53:00AM +0100, Geert Uytterhoeven wrote:
> Now the mux core provides devm_mux_state_get_optional():
> 
>     drivers/phy/renesas/phy-rcar-gen3-usb2.c:944:1: error: static declaration of ‘devm_mux_state_get_optional’ follows non-static
>      declaration
>       944 | devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> 	  | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from drivers/phy/renesas/phy-rcar-gen3-usb2.c:20:
>     include/linux/mux/consumer.h:64:19: note: previous declaration of ‘devm_mux_state_get_optional’ with type ‘struct mux_state *(struct device *, const char *)’
>        64 | struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
> 	  |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fix this by dropping the temporary local wrapper.
> 
> Fixes: ad314348ceb4fe1f ("mux: Add helper functions for getting optional and selected mux-state")
> Fixes: 8bb92fd7a0407792 ("phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   - ad314348ceb4fe1f is in mmc/next, and a PR has already been sent
>     https://lore.kernel.org/20260209133441.556464-1-ulf.hansson@linaro.org
>   - 8bb92fd7a0407792 is in phy/next

Thanks for sharing :)

> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index cfc2a8d9028d58d0..65cbf330bd8fa10c 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -939,16 +939,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
>  	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
>  }
>  
> -/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
> -static inline struct mux_state *
> -devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> -{
> -	if (!of_property_present(dev->of_node, "mux-states"))
> -		return NULL;
> -
> -	return devm_mux_state_get(dev, mux_name);
> -}
> -
>  static void rcar_gen3_phy_mux_state_deselect(void *data)
>  {
>  	mux_state_deselect(data);
> -- 
> 2.43.0

LGTM.
Tested on RZ/G3E.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> 

