Return-Path: <linux-renesas-soc+bounces-10235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA4F9B74D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 07:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298791F24B92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 06:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3841482E8;
	Thu, 31 Oct 2024 06:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZrKCiD4O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BCC15D1;
	Thu, 31 Oct 2024 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730357943; cv=fail; b=D6w+tupL0JacOMQxZ5ifJ2GBLsksq1fCO4WLeHBp65d/1K/WTC1ih56yzhlqiyyFeVugE4UtOeulN3J/90jBkJ3TUsFwP+yKtQM3gZAH1VOiBNhpioj8cDVm+LZxdPo0/9YLXQgiWCEYQzea4qSBecLN7Dgc8PNMbTzZx538t1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730357943; c=relaxed/simple;
	bh=1ub9jTjEL2bVKCHybMspH1KDTbEA9Bp+195PpCVmPSc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i/7nZGO5YWK1QuB8IkcWw8B7LB7SI+Y5BdimtGWKWCU5WvooZZZOpkwQDm7JmVrLN6SGtNz9ko2fk557NXRjYeJLHp3SKGq113GHauAHgnkH/gj2QuNCaZ8cWMAEgM8VbuhGAQ1TbUYBJQTaNRJWxKJR1t1n40EvZa/cSVgjIUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZrKCiD4O; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2OzZSAkxQKbBKrNhazfH9bzAVN9X0C0wqTmQqsfcPc43tPWs3EwgYSWXVf314HdiOHviPX1hmWmQ2+zdUgmByPC1RkGQzmQ7+Dr5u8lu0zeG2TCalfGcPuuCQVx9wFg3YHPyE3q78/Puks1gbpN0eejlLZjOgFIFGoWNgTSs8ZgZEaeJgT0Qv6zx1t1j+d0LEbONLDhLHDt9MbQnbZLN6h4plRT9OjgI/y5+4q/C55VNMS68jeGk26cvaoldf4LKGnkWwIEFCUd3uN/rTIQQNanAovqAI/UUFGatcm0XFH23y0+Jf7E0S8oWBgAz45cyBUuRJGElgvuDMr6AoR/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ub9jTjEL2bVKCHybMspH1KDTbEA9Bp+195PpCVmPSc=;
 b=m7u/mf1PWGFIS5sQyfApEad0eJZxzrn1A3SvCC1twiI+iQP+/69BZQSnUHUJf1Fw6arwjoH/xpxsI+ZMDFNkADCNy6DRuKIu0UtAV+wjNmketUB1d5cayG5ayJPMRlaQo6yh3u3bwF6Nb+XuPzZb/HXV075b5bArGL7+NeGga/toifcCXzHs2Z2eWUCmpWD2q4CKvHECPS7cPVapqcMGpVC4xTsC7S43o8hN2WBU8iUnVhI3BoxG1RfeUwjmGiujE43mCvo84MM9e4x2XOKDV3t6/j+kNDjtryh0s7mGF0W08sRiQ74/HyThOqPMLZy1NpnrikXXgr3UAxa0UgyAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ub9jTjEL2bVKCHybMspH1KDTbEA9Bp+195PpCVmPSc=;
 b=ZrKCiD4OjTXaNYYFi53qsG/cDEN3ir4PqELhh7SkfVYEvTxqKCq5xIl1pNYk9wMr73xYiVCQb+WtLCkO17caEQAuz0BTbVp1aSUp8lfzPTSvqRZoCB1BaOrq9sg5HW+Q9vgi6R9TrdPqMuKk9P+rp8cNJEntTbURodNbo1cw0Us=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB6749.jpnprd01.prod.outlook.com (2603:1096:604:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 06:58:55 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 06:58:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] clk: renesas: cpg-mssr: automate 'soc' node release
 in cpg_mssr_reserved_init()
Thread-Topic: [PATCH 2/2] clk: renesas: cpg-mssr: automate 'soc' node release
 in cpg_mssr_reserved_init()
Thread-Index: AQHbKyMp9H60O77C/0i707NESKfh67Kga7yQ
Date: Thu, 31 Oct 2024 06:58:55 +0000
Message-ID:
 <TYCPR01MB11332D26ECE798C07B83804CF86552@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References:
 <20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com>
 <20241031-clk-renesas-cpg-mssr-cleanup-v1-2-628274ecbfcb@gmail.com>
In-Reply-To:
 <20241031-clk-renesas-cpg-mssr-cleanup-v1-2-628274ecbfcb@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB6749:EE_
x-ms-office365-filtering-correlation-id: 420b06a8-532c-41b9-c5a7-08dcf9797c6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1Y5dzZwRTQwaEo5NVhxUis0eDJsZ2ppNWhBYzVKaW1lZlRuNGNkdVV1UXJT?=
 =?utf-8?B?NVUwYWM4YTdRVFZPMmtMaml5WHcvYk5vLzh0cks4akFETkpScFZoVUZ6T3Nn?=
 =?utf-8?B?QVJBSFpvdFliZUhBUktTM0FqRm5ORDh4SnVQQTh0QXBsZFlCV1V6U2t6Qlkx?=
 =?utf-8?B?NjBOd3ZabE5UYW5ReCs0OXNWRjNEU0M3RHRJNnVOa1pra0dTL3lXMFlOamZh?=
 =?utf-8?B?cDZMUFdJNytyYThUeFJhTmlseDZjYnZVK045WWI2azFwV2doMWFlKy8yaVNo?=
 =?utf-8?B?UG1EbnZVdlR1Z2NQaXVMV2M1Yk15ZmlvdzhUZnFyWmJGMTcwUW1WUFpwRzN2?=
 =?utf-8?B?YUZ1YVBGMWQ5bjJpRmpCQlV4TWNhSHFEeVNPejRxQkJZV0hERTlMZWtBMmFY?=
 =?utf-8?B?Ui9TMDFGN3JyZ0JpL0d1V2t3bFN5Rm1yM2dFV1NXWUFlZVhqVnZIUHNvaVY5?=
 =?utf-8?B?VDdHTHV2WjNSdGpPUUIwNFRSK1U2QjNBWGtycjhzQ0ZQUGhXcWFUZDg2ZVpJ?=
 =?utf-8?B?UGdvSFFlTlZESzJUc0ZpaFhIL2lhcTNZZEZ5ZW81eHhZSU9ORjlNb1lRTjY2?=
 =?utf-8?B?U21JZUZOUG9Vb2JwaUdIY3ZiVkFQbmlraUU0ejZlaHpQSGFwd0RxdU80cW4r?=
 =?utf-8?B?WCtwdjRYOU5BQjZJQVVZckhIbVJpOURwSTZHaTRiRnBEMStQdndvM3RiamxJ?=
 =?utf-8?B?Zm4zUC9yQzBsTW9oOEM3eExmMW1iZm11VXR2U2Z3ZUEwN1pWUU9STzVIMTM0?=
 =?utf-8?B?TCtKZlFKa1hkbXZMZGVtek9VRElXTlh5L2tRaERYRS9hcHlNeFpIc04wNm4w?=
 =?utf-8?B?ZXFmaURIZThkc1VZeTA2SE56Q3JDQkowY2o3K3pIaGFpY2hKSDRDc2Fxb3d2?=
 =?utf-8?B?T1lnZE44Sm9SZTFTK05zVXk2b0xueGVhdm9yVzJReS9HMU9CeklYaEpka1BX?=
 =?utf-8?B?d0VyZGVzT0UzSDZTQnZzRnlQbG4wT3diZVUxVG4zcElVVThZTWdLcGdKZ2VO?=
 =?utf-8?B?Q2F5dXQ4S1RRTHdpbVlpbzJ2bVlWT1E3QVJpLzhxKzJrUjFjOCthQ2pOYit4?=
 =?utf-8?B?d2hmVzMybDR5am83N0thQW5hdHpra3NRY2R6ejBrc2FZcnA0Q2JxdG52UFRm?=
 =?utf-8?B?N1QyTnFnWGhLYmZEd2p3eTZ0RDR4c2g0TDJ2VmwzdHFyT2JocmFOT090eFBr?=
 =?utf-8?B?TDlOVjVpMTlEbkhUZ1VqWlhlQVFhUzdVVml1SlBScXNYdiszUVZTZUlTM0pZ?=
 =?utf-8?B?R2ZqZWxPZnppajQ3eXBYMlN3SGQrSjdvWDBOb2phbGZmaW9MbkdFYW1BWnVY?=
 =?utf-8?B?TUI2S0FzdWZpQ1pEMHYwbDhGK09mU2Fnakk1ZVV5Y1gyeWhHN085aTMxeXZp?=
 =?utf-8?B?UUVKR3NNYVloYmxsdElYUEZVOExjYkRjMVduRnBqMGN1UkVBTDFXK3UzUEUx?=
 =?utf-8?B?U3o5d2hTVThvN29SYlV5QmlPMVVhOGt6RVpwR0NhTGRVZFA3enZaNG5tL2Zq?=
 =?utf-8?B?TGNvREVjZ3FqTnVGam9nTzVsZCt2ajNWcWlkTjRPcy85MWVmQ1RxVDNVYTI2?=
 =?utf-8?B?RVFUU1lPaE9mM0tmUFhFR1dSTlVFbUZlTldxdXV0NGhLb2NCYXhUTWJhdUdH?=
 =?utf-8?B?QkNQZGVtY0prM3dLOURkZUtoMkV0dzN3cXNjajNyM3dybXp6dFVUZUYxR1dm?=
 =?utf-8?B?WC8reUM1bXZBaSt3YkpTbnlRL084QU54clZnaTlSL3pMMGRRaVJxR21ybjJ5?=
 =?utf-8?Q?MyfAVrdUlyQSu5GK1OI2I+yBF9QaR4LGSFUCZA8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHV6V2l0RTZzbUNSeSt3WHRHU1VtZzB2eHZ1NG9MWlF3Q3BPYWJFNkFPcTZF?=
 =?utf-8?B?bU5Uc3dLRGt6N0UwclBZelBKem5FL1FkdEpIQ1B3dEpOMk56b3B1OWRVeGFU?=
 =?utf-8?B?WTdzdm9TTlJDQWFudi85MWhVbi9scEszUFpXZTEzK0VRU0pBWlZqVk5NNkVX?=
 =?utf-8?B?ZTdOZ0VuVXllclh1OVd6SURXNHpZK3U1cE9VS2ZkSkdpZzNyajkvUDdrRFhM?=
 =?utf-8?B?M2tSdHRVZkM0a2MyNFowZnVjbWpzcjA5WjBCOFNiSWtqbHpmVGlhYi93amY2?=
 =?utf-8?B?OHkvKzREcDI0K2NjOWlxRFZFNHRwcXVZd3VCTGo1N2J4dzFpQnFEK3U1Znkx?=
 =?utf-8?B?aGRnVHE2OWN0YmwxQUxlM2hlT3ZUeCsxQmxNSlVBbEhWSkp4b2g4M2xvd2RB?=
 =?utf-8?B?QVpFaHh5OU5MRUZwejB3NnZzM0x0UEg1T0cwSXhhclh6MWtSZFl2NjJQOGNp?=
 =?utf-8?B?M0Urc0E3YUNyVE9FTWJ3c2VaUW1BWDJvcE1zYktEcFR1dklxcG9lV1BLVlg0?=
 =?utf-8?B?MVpmQ1ptaUJvajdKcGhyTVhFdEM2ZWQ4TU4wM3oybzdTVEplOXBFZmo0blBR?=
 =?utf-8?B?ZDdIWnR4bDNHeDVqSXhzQktHTThTbkhVS09pZWp0aWk5b2ZlSWl6ZzNEQ1I5?=
 =?utf-8?B?bXpYTkFGbEFUUnFrZHc0MWJ4OTFTbEZjVnMwN3liaTJUNGtKbE95V2J2M0Nl?=
 =?utf-8?B?K3ZZdk1ubXdoazRYY1Q3bG50R3BwTmx0TGVWdStGV09mZ0RoUmxnMTNYQXZl?=
 =?utf-8?B?L2hZcEV0ZmxzVlF0eFU3M3FTREhFcGowMFE5Mk8wMmlKWWYxSHJlTHZaMUZU?=
 =?utf-8?B?QmV5TU9vdXJFS3NHNXEwYjdFYjNicmZBVG5BazVSbkx3QWNRUDhYOWY4MXZL?=
 =?utf-8?B?UVJMQStJcWxHdzF1d3U5WXIrWlFILzRzUXpUUGQrUkRiNm9FWERuOEI4ek85?=
 =?utf-8?B?VVhKWkdWelBIY2N0QkVpRVNhMVdJRXI1UHExSURBMHhNOXdpU0hrOEtDVlZw?=
 =?utf-8?B?bHhVZnNxYjhCN09TRERPY2k2U0Q4UEpSVnVGRlpXQ1FnSDRRbUhzNStQcXN5?=
 =?utf-8?B?KzVNaE5JdWhEVWQzSkl2aWJ4WkoxalJ0bDM3TVg4QldXb3k4dWlLQlllZUpP?=
 =?utf-8?B?OVFFNUhJYTE1VzZPTmJKazVwK3dtVmZTdWF0S0l4Y1d4SWRjbUFSRmRxQmI0?=
 =?utf-8?B?QU00emM4bXFnTGhyeHdJYzJUbkp1amhVLy9pTngybXlzOVdJcEZ0eGFDb0xy?=
 =?utf-8?B?SU1oOFI4VUlmNG1vVUQvYjBXd05TOGplSjFmTGtPT1IxRnVFWmE4NityNVlx?=
 =?utf-8?B?Ry9hazVDZFhIa2RDT0NOR1FXMHhFUFFOYW5ud2FWU1dwZUhkNEtzWjF5S254?=
 =?utf-8?B?UGdMSnpsNVpwTWh0NVhlZlp1Q01Hd0c5NFh6bHVqYnRXeUR2ejlDL1k4aUdL?=
 =?utf-8?B?Znp4eHlUZ3BJeE12eW1OeUUwZDF0S2U0U2NVK2xTVGpWVVVQdzl4UU1yVVZY?=
 =?utf-8?B?amtkeDV5UnJRRUo0WGF5ampOUXJZaXJWd3VUN1U2QVNZVHJXcXBGSmVvRG5H?=
 =?utf-8?B?bXRqM1RkTFloQXVLbzBNZ05HK0JCdWVVSGhpVHY0Z0ViTzNudDdCcUFCVjNn?=
 =?utf-8?B?TkZINU9sbURVZDVTTExaM0FpS2RkUHNRNHpEZXFrdTErVmtHQWFuNGpmbVB6?=
 =?utf-8?B?a1FRNzlZNy9kdVMzQ3NEekp1ZEFobkwySFgxNkoxajhlSnJYM0xHV0VaWkxK?=
 =?utf-8?B?Z0FQcWdYV1ErUnJFc2o4RDYrR2REYlFrNzl2b2dKdElHWWx4NFF4Z29pNm5K?=
 =?utf-8?B?ZG1VUkxaaWR0eXVGeXhMOUhkNjJoTi9abndUSVBPYjY2MlpJN1FFOGtzNzln?=
 =?utf-8?B?T01FZWFYRmd5WU9lQ3FGYnMwL2wxUFVxbmhqWHNFdDJEay9aT0d3SnR0c3g1?=
 =?utf-8?B?Mkp0M3pKRDJKTFExVzh2aEpxTzVFcC80Q3BGRnR2ZHJ1dVBNRXBIbFhYWElM?=
 =?utf-8?B?REFGTE56SUliZDFubzIwYnozS0NHVUNIMjFMSFZ3SnNFWC9MVkZMRXlHUm9U?=
 =?utf-8?B?Y25YcDJPckdmNG1oSkwzeG1CSHRxb1NtN3VSMlZSK2lVempQTEp6c2ZlcG54?=
 =?utf-8?B?UDEwWjMydG9lNU1wNTNsR1JoU1VoRUZaZmhHd0N4aWd4Q2I4MlNGZy9tN0o4?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420b06a8-532c-41b9-c5a7-08dcf9797c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 06:58:55.3492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZwp1IF5X8V2Dg/slEZpkroxnJXwkbOkh8ykACfYSxpl4BrOTPVM9ZW9hec6OLIg3M/Bn1mxO90jptKn0LXfH1fYHl6XPjCEa1xYffkDCNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6749

SGkgSmF2aWVyIENhcnJhc2NvLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaA0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphdmllciBDYXJyYXNjbyA8amF2aWVyLmNhcnJh
c2NvLmNydXpAZ21haWwuY29tPg0KPiBTZW50OiAzMCBPY3RvYmVyIDIwMjQgMjM6MjYNCj4gU3Vi
amVjdDogW1BBVENIIDIvMl0gY2xrOiByZW5lc2FzOiBjcGctbXNzcjogYXV0b21hdGUgJ3NvYycg
bm9kZSByZWxlYXNlIGluIGNwZ19tc3NyX3Jlc2VydmVkX2luaXQoKQ0KPiANCj4gU3dpdGNoIHRv
IGEgbW9yZSByb2J1c3QgYXBwcm9hY2ggYnkgbWVhbnMgb2YgdGhlIGNsZWFudXAgYXR0cmlidXRl
LCB3aGljaCBhdXRvbWF0ZXMgdGhlIGNhbGxzIHRvDQo+IG9mX25vZGVfcHV0KCkgd2hlbiAnc29j
JyBnb2VzIG91dCBvZiBzY29wZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBDYXJyYXNj
byA8amF2aWVyLmNhcnJhc2NvLmNydXpAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvY2xr
L3JlbmVzYXMvcmVuZXNhcy1jcGctbXNzci5jIHwgNCArLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmMgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3Jl
bmVzYXMtY3BnLW1zc3IuYw0KPiBpbmRleCA1ZGM4OWIxMDA5ZmUuLmJmODU1MDE3MDlmMCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmMNCj4gKysr
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmMNCj4gQEAgLTk3OSw3ICs5
NzksNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY3BnX21zc3JfcmVzZXJ2ZWRfZXhpdChzdHJ1Y3Qg
Y3BnX21zc3JfcHJpdiAqcHJpdikgIHN0YXRpYyBpbnQNCj4gX19pbml0IGNwZ19tc3NyX3Jlc2Vy
dmVkX2luaXQoc3RydWN0IGNwZ19tc3NyX3ByaXYgKnByaXYsDQo+ICAJCQkJCSBjb25zdCBzdHJ1
Y3QgY3BnX21zc3JfaW5mbyAqaW5mbykgIHsNCj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKnNvYyA9
IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvc29jIik7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpz
b2MgX19mcmVlKGRldmljZV9ub2RlKSA9DQo+ICtvZl9maW5kX25vZGVfYnlfcGF0aCgiL3NvYyIp
Ow0KDQpJIGd1ZXNzLiBieSBsb29raW5nIGF0IFsxXSBhbmQgWzJdLCB0aGUgY2xlYW51cCBmdW5j
dGlvbiBzaG91bGQgYmUgb2Zfbm9kZV9wdXQoKSwgd2hpY2ggdHJhbnNsYXRlcyB0byBfX2ZyZWVf
b2Zfbm9kZV9wdXQoKSwNCnRoYXQgZXh0cmFjdHMgb2Zfbm9kZV9wdXQoKSBhbmQgZXhlY3V0ZSBp
dCBmb3IgY2xlYW51cD8/DQoNClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3RyZWUvZHJpdmVycy9pcnFjaGlwL2ly
cS1yZW5lc2FzLXJ6ZzJsLmM/aD1uZXh0LTIwMjQxMDMwI241MzUNCg0KWzJdIGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEyLXJjNS9zb3VyY2UvaW5jbHVkZS9saW51eC9jbGVh
bnVwLmgjTDE5OA0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5v
ZGU7DQo+ICAJdWludDMyX3QgYXJnc1tNQVhfUEhBTkRMRV9BUkdTXTsNCj4gIAl1bnNpZ25lZCBp
bnQgKmlkcyA9IE5VTEw7DQo+IEBAIC0xMDIyLDcgKzEwMjIsNiBAQCBzdGF0aWMgaW50IF9faW5p
dCBjcGdfbXNzcl9yZXNlcnZlZF9pbml0KHN0cnVjdCBjcGdfbXNzcl9wcml2ICpwcml2LA0KPiAN
Cj4gIAkJCWlkcyA9IGtyZWFsbG9jX2FycmF5KGlkcywgKG51bSArIDEpLCBzaXplb2YoKmlkcyks
IEdGUF9LRVJORUwpOw0KPiAgCQkJaWYgKCFpZHMpIHsNCj4gLQkJCQlvZl9ub2RlX3B1dChzb2Mp
Ow0KPiAgCQkJCW9mX25vZGVfcHV0KGl0Lm5vZGUpOw0KPiAgCQkJCXJldHVybiAtRU5PTUVNOw0K
PiAgCQkJfQ0KPiBAQCAtMTAzNyw3ICsxMDM2LDYgQEAgc3RhdGljIGludCBfX2luaXQgY3BnX21z
c3JfcmVzZXJ2ZWRfaW5pdChzdHJ1Y3QgY3BnX21zc3JfcHJpdiAqcHJpdiwNCj4gIAkJCW51bSsr
Ow0KPiAgCQl9DQo+ICAJfQ0KPiAtCW9mX25vZGVfcHV0KHNvYyk7DQo+IA0KPiAgCXByaXYtPm51
bV9yZXNlcnZlZF9pZHMJPSBudW07DQo+ICAJcHJpdi0+cmVzZXJ2ZWRfaWRzCT0gaWRzOw0KPiAN
Cj4gLS0NCj4gMi40My4wDQo+IA0KDQo=

