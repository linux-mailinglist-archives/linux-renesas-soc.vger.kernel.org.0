Return-Path: <linux-renesas-soc+bounces-18994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDAAEFD8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 17:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC53B4E7665
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 15:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B8F2797B2;
	Tue,  1 Jul 2025 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nCkVzAFA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F3275B04;
	Tue,  1 Jul 2025 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751381957; cv=fail; b=PpwZdwaqG1w6W7rEGpUFC+IXg5kdvoiMgiszyFd+YMImMAqqmqyDW/uL3CTU2mE4AGREaeQ0Lac2eVOuaEXIqHMVCJmAl35CnqadVMVheqwjxEYl9V6rLHqCl9XIWFAJr5jvHVnR5M39LZd9bRu8UeuGAQDiPn5FHyFBk6Y7om4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751381957; c=relaxed/simple;
	bh=l/bxBcK5CreDqWoa0bzFTxiDw6/RNU0HKeVl+M/qfxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZuH02lryxgczunwOjopsNWWPNe7SQaNw+eihwP6blrD/k5tLLn9oLMI1MkTKOJjZtsaedUE2pr9AfPDWRxvpJ2aqYgWug8jfNzXyQqgBMiwIO4Bo4dZgHynPuEh4wIxvrr646ED5hMGdBRU2UOelyyHRJrlAMCvhdQujbXLFlSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nCkVzAFA; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGZ1xVA/eyQi4KhzykfOWg4D7xzbkbaplmW77YkWAFV4XPpw6Tg1jbAoOuaq6f+7eo4h1bFLu/kBAnBGAagAm3vaEsoLD+I+MzfaGjsEo9yk7I/RGUD8J77RtzremNAnVfEzOVdFZxXyjo6rOjujNUDbULNNBI0KmivaeDdxb+ks7y5XqQLiXyzCm18AVsjvLRPeWFY8oaUjrQmgMuqgChfSpat589QhiKNdtiV8j5/xJxMPw4JOUqE0y0sa+rcKauPS4Eck08fiBLKnPF2oGaWQNL4ESMFYK/ysd/cbkQaI4F2LJA7tzvmb2MpxOo+3WUmbUcrEAJ+urm2B/Qotlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/bxBcK5CreDqWoa0bzFTxiDw6/RNU0HKeVl+M/qfxc=;
 b=OqF7LJWnYMCMesJajiQ60zwPdQ0R1kIOxFWo5Ey1VDOH3GzZy9DOczENyNOrFFJe4CZeYlXSGAZVQsChuEUF7da5m7B59Gbx9jOcsBbZvZw1CYrVsREwvKXyf+MFWQwAj+kXNtFuF06LSlRNRZaFJPXTVv+F2GasdZN4S+11+tKMK0ctga9+3um4jZuZUCV5kqiJaeykuJZcrhhzkx8hx6mq0H6uJopS9maLKrTJtgff+nziS2p+2Jtf9rhdD4alAwINzsBdI5oEHFhXSH1oiBz/YvLHY1hoCjMG2oKClVT0LvpfuCTnyK3l43Zgnn6sRce11kQeg1buZWWYc1r00g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/bxBcK5CreDqWoa0bzFTxiDw6/RNU0HKeVl+M/qfxc=;
 b=nCkVzAFAAtOgqtWyyHcMdj+/HezT8A8et9YMcfBtG5rRvqrZdbACqenHyRpbjm1IxmURq3Vo2LuO/erIk3HW4nKTfzldt+0sl+08ROug+hTByB9ifv6sY6Hq4SQkXif/sTDxdQOqqktLiaZm8em5lMrS87GB9ynfog5q33VaLHE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYBPR01MB5470.jpnprd01.prod.outlook.com (2603:1096:404:8025::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 14:59:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:59:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Index: AQHbrVNDGj8C8kQeE0eZE1bPrrwQPbPEGWSAgFmCYRCAAAYYgIAALWkwgAAGyqA=
Date: Tue, 1 Jul 2025 14:59:07 +0000
Message-ID:
 <TY3PR01MB11346C70FFD599B85A790B8278641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYBPR01MB5470:EE_
x-ms-office365-filtering-correlation-id: c6a7ee78-001d-474e-c228-08ddb8afd406
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NTgySGpHaThjeXFuV0VOQ0FyVkZ1OE9lSnZFc2JXeFdtQmJEbXlpZDdBTVRX?=
 =?utf-8?B?ZHpubDBoZUx6ZUk5cTNsa25tWFMvbnFWbU9sSGNDd0llNTc4VEY2Z0RvQ3E0?=
 =?utf-8?B?RkM2ZC9KbzcxRGx5Z3NvOFdYN2RGNktWTlZhdjFNQ2dMZEMrRlUzN0dKNDhC?=
 =?utf-8?B?UnZpSy9OZHJMK3kxQkdMUHd3M09hSzh2YVVKZEs3bGt0bkE1QVgxbkZvVEJx?=
 =?utf-8?B?Ui9neXh0VW9KZ3N2RE1yMGQ5K3lLYzduZkg2VWdYR3JEcHZOZ3VRUmFoVGhv?=
 =?utf-8?B?dTV6QlJPalRlcno1aTZ6bjhkSXdOWGR2OVBOOUN2bnZLS1lwSkNSK2FiNFJr?=
 =?utf-8?B?ZDIxRjdFOWVYTUtobVVkcHRmYXhJZlhwTVpPanhvelFsa21qMUU5ci9qYkhG?=
 =?utf-8?B?cUVqTGRhL2ZBVUgxZjd4QXcxZEliNjBIWnhzM1NNMXFZOE4wZ0xRdWsyelox?=
 =?utf-8?B?dkZMbmZDektxODlVKy9YQklaVytGOWNpMk9yUkVYK29CODBraU1yOTZWbW1O?=
 =?utf-8?B?aWVQcFM3c2JKU2k1aEJ5VmVPd281S1lhdHo1REZuT1BtakZUMkkwOVNVTmRV?=
 =?utf-8?B?MUpkM2JhL0l4ODEza0Z1bDF2OFlRTW1BUVNEU3RocHBtTEFhc2hjK2MzK0c0?=
 =?utf-8?B?V2ZjbTkxdjFSQ1FZamZWb2JLTkg5Y3kvU0Z0NFIwam16QlFpbGNCOHN3dWFF?=
 =?utf-8?B?MWQ3dDk5TXdXbVp4cDRJOXdwc0JKUDZLTHpjL090STQ3a2crR25XS2pXR1ZI?=
 =?utf-8?B?TDF3bUFFVUc2TkMrcXQ1K3FwRVJPa3BNdXVEOVRzc2JxaEQ3Y1FBeUErajNm?=
 =?utf-8?B?L2tOT2JVQUVKVEwrWXNyNmErSkQvbVEvZG40ck1NNTJkb0wxUGUzME5Qb1lq?=
 =?utf-8?B?aWFha2R5bTgxS0p0M05xUktmbUtDU3NRYjg4U3cyTjBKK2ppT1g4d0ZMaTZW?=
 =?utf-8?B?SG8yNU1zR2Y2ZFpZMk9sRHljbkwzSVVnS251S3pkVStJaTcvNStramxhQUsr?=
 =?utf-8?B?Y1NHWXI3bzk5a1BReHNlQ0dmK2V1VGd6UmhQY0JVOGxuWm5NNnVQMEdBMnlG?=
 =?utf-8?B?cVMyOHNnVEJRY0FwVVJiSk5jVEJzZVYrZDZLTXhaYkF1NHZkR0xxSkh4dTRj?=
 =?utf-8?B?cjFqcnlIdEZvR0pXM09sTnkxSDdiajFDMk1mZC9Vc1hLTWNuaS9TdGIwTmRZ?=
 =?utf-8?B?V2h2Q2greHpqWldYVVpPei9rNFJCbnhod2tTVWoyeTVvWTQ4NkFpMGZkdHhm?=
 =?utf-8?B?aDFKckY3N3lXV3FPM2tNQ2NwLzZZUEp1QnB5K3djQmM3a0RGSTNsMmlPQ051?=
 =?utf-8?B?V3VySUtOZGpUYStudWVoNVVZWUhiejJkbFdqZUxUVXVQWnhyZEtKdXZLeG5P?=
 =?utf-8?B?akI3M1g4V0NrNkpGWUFSdnZlNTNUZzEyRmxYVkNXbk1HSTZ3YXduWWtXVm9k?=
 =?utf-8?B?WUw0NWNpdmgyK3dPWndXQTRBVEx4MzBubkFIU2R1eW5ITUN3NTdlSnVOaGVN?=
 =?utf-8?B?VTU3Z1NhUTF0MkRpNHE4RDFQazdJNUpNRWd0N2lqOGVtTGdOYVdEK0ZGb1Br?=
 =?utf-8?B?RktWWXMzTm5hZnl6QzVWN2d3ZmtNbmdkNjdCZVk4Y1pmbHIwNDhNUkhnS3Rp?=
 =?utf-8?B?azhpejBWQnFwQ21NbzFnYWFWQjNpTUtZT0hJdjZUZW5ZbDNWNHdwUnhEYlpp?=
 =?utf-8?B?N1JGdzNiRG9ORkVnK2xDREpraU1DUDZwQytqTnZOVzg0Q3FId2lON2tkd2ls?=
 =?utf-8?B?L2lBUXJhcytwYXVST3I0Z2drd2M0dUpZSU9DSUdqV1pXRnpHV0MzMzhmT0Qr?=
 =?utf-8?B?bXJpYTUvM0RsNlBMM0Uzams0V1FzMmRBSmVCWWNOaVFQOHhmUVNBbDZQOEg4?=
 =?utf-8?B?anYyWlh2cHl4OFF2NUw4b0FvRFFoMzlDTjBiYWVkVzQ4V2ZaanNybkRlRVJj?=
 =?utf-8?Q?lqMP6PcWTNM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N21DYUo2QWo5Y1I3aFowKzdEbXJ4R2F2VVJUQTRtQ0FVVEd6clNWVXlpQldQ?=
 =?utf-8?B?NjF6bkRtVEhnM0NoSHRTZ3RpeXdXeTJwdjg3UXdyYnBtSHNabW1pN1FDMTli?=
 =?utf-8?B?aWRZaEVnWlNtWE5nY3I5VTVvOXRCbGJUUjNYbVp0eGxuK0V6TmFTTzd0eG9D?=
 =?utf-8?B?Mmh2djg4TzlOTDhIZVVhcVFkOXZHdjZGOThuQWF5YmoyeUg4a3ZpSnRacjlE?=
 =?utf-8?B?dU5FNVRJSHBOTjRSbW5va0FtdSt5S3FCRk5QV0tERHhtU3hRanM2OFRHVHcw?=
 =?utf-8?B?Nm1HUFNRTDBLT0NLVGlJVnBUNE1lYnhUTXlqNVZ3a0dBR09ZYmlhL3dpdy9r?=
 =?utf-8?B?MnN0Qm5YOXZEQlI1WjhTaXg3WldKMGd2a1Rma3p2bno4SGNXMEQwbWN6L1B6?=
 =?utf-8?B?SFNwOGVmeDdlRlc5TGRLTEgxaUVTdmxHbmdJanNnKzlsOXRiRDZLQ0ROUmww?=
 =?utf-8?B?L0dWZWFXa0lRMGVWeEgyR3BrM0NncTIrSWE1cTZsOUg4Mi82SENiM1huZm5L?=
 =?utf-8?B?aytKSDEybU1wYi8rc3ZtR0ZQL3J3Z0xJZ1Uzd1pVR25EeWJJd2pBcHBucnR5?=
 =?utf-8?B?bmdCNk5UZkgyUlNmY056Zm9LemVRY3pzZ1VDUGlMQ1gxenljTlB0cGV5RFlm?=
 =?utf-8?B?N2tWcURwaUZGbitWRnFyYmY3WjFITmpJbWZ3QWFCdzE5NVdsSXYvZzhubVM5?=
 =?utf-8?B?MktCK2RtbEJZSG9JZndFMmpHb0FCd1RFbnJKczArS2F1ZitsT1MyRWZ1cnN4?=
 =?utf-8?B?V0diTklybG5VYmdjdnBmLzVOVkN4SkQ4aXRCNjh2U3lsd2xDcVNkTFBxS09I?=
 =?utf-8?B?UmFSMVZNQUtaN2hrb3pvaFVBYkJ4VGFTUEw1U2xzWVVCNUtNSU5LcER4LzU4?=
 =?utf-8?B?TDdaaEkxakJNRTgxSGg2VENJRWZteXlCS2g3aVZ2WFAvMVJpT3B1cmR0dUFX?=
 =?utf-8?B?QkdYQkhhQVN4TmZGUXk5SnFTMzRaMFNMb3g2Z3hUUzZDNmlXaktvdDAwWE9l?=
 =?utf-8?B?RUJLRGFxTHBwMXJ3QVAxWVJGYkEwOWhxZ1ZRdktjTDN5Q1ZjZDlpRHlBU1Bh?=
 =?utf-8?B?QnA2OVRSaThXT2daNk02K3ZjSFRTVVhMNmU0RGVjRHdINDNrRy9kSHN0czhQ?=
 =?utf-8?B?N3BZRkx5am9LVFpic0c4NmFWZ0oxTDhPSS95cGNHSTZNcGl4bGcwdFNZRWp5?=
 =?utf-8?B?N1BTb0pvNzJrTkhrRGprMzVibzV2TWhmNGE4Q2Q1bUIyTDBmS3dLcjNuSHFL?=
 =?utf-8?B?MmtmOE1MY05VZDB4WGltNXBFME5SUzhGb2dXaGF2WGVXdXU4U2IrRjdpTWQz?=
 =?utf-8?B?djZmM3FNTzRRRWkxa0tNa0J4VXJEWXRTK3lEbVJJaC83NjQ1WEMrNENCaWx4?=
 =?utf-8?B?SGNXUlc3Ym1sY1duMkJ0TFNaclBGLzVxWG04dHN4cWEyNE45eFplSHdtYy9U?=
 =?utf-8?B?ZVNoa2tWN0dobm9KUGdoKyt4NUNtWjdQVjRMb0xhckxENko4dFRuWTJ6RHI2?=
 =?utf-8?B?T3NDbU1weC9aVFlvWnhTVVdFekVOQnY2bG5BQlNTY1E5RWZ5UmlkOWI5SHFT?=
 =?utf-8?B?YWNJeE1qZ2xDbkdoOXhRdFBMa1k1U09SZnFSRERWNzNSTDdJVzJhOCtQUTV6?=
 =?utf-8?B?TFNwUGgwa05ycE9TK09iMTFCQ0t2NTdmWGlENFIzWGFMb2R6WHJRb1ZMZEZm?=
 =?utf-8?B?WEZ1MWhXeG5lQWpjNktkdzdaenhycE9ycnFndjZKQ1BPREtmUktrZTBOdDVI?=
 =?utf-8?B?SENBMnZVZUZQNUtYTkUxZ2FUQWdJMElMWU04ekRFMWs2VnpSUThKNk9DVGxG?=
 =?utf-8?B?aDMrbEJTZU1PQ0hJVkkvKzZuZXZjYnlORWpKYjlLU1AvU2Y2UlBqZnZ6Rkp5?=
 =?utf-8?B?eEEralNuSzBCMWJKdG9TbnpWRmU0N0xTUnd4VEpFL2NzRzRrYXZMd1dtd1BB?=
 =?utf-8?B?WkVIMll0OTRJLzVQelloYmkwc09MK2c5MTBQdHdVS2lZWkZDWXljdzNUVmYz?=
 =?utf-8?B?bnR3cG5CQmR4Ym1oNnh6MUNFRDBUVTIzWEdQa29GTUhBVEZDYkRZVnRXdERS?=
 =?utf-8?B?NUlHcE9pTWQ1U0hJVFFTMGtLSmdXeHZpRUNCUG5Ra3JZRnNsalArcnZkeGdZ?=
 =?utf-8?B?YU53TlFEWGJMNE83YjBtaktpZXh1d2R3WStLUDB5SmJSY2k0d01OU2NFTDBF?=
 =?utf-8?B?MWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a7ee78-001d-474e-c228-08ddb8afd406
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 14:59:07.1999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RkAc9Vpk52NBR7pB7ocCi0NpiLpSrvAXzTk5hMOda1X8d5bJdN/F+Fpb0VJg8UZt1WCc6efRQxYEPNt/M8E8a/0O+WUiSu/hJMz5tQMTPUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5470

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMNCj4gU2Vu
dDogMDEgSnVseSAyMDI1IDE1OjM5DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGFybTY0OiBkdHM6
IHJlbmVzYXM6IHI5YTA5ZzA0N2U1Ny1zbWFyYzogQWRkIGdwaW8ga2V5cw0KPiANCj4gSGkgR2Vl
cnQsDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiBTZW50OiAwMSBKdWx5IDIw
MjUgMTI6NTANCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiBy
OWEwOWcwNDdlNTctc21hcmM6IEFkZCBncGlvDQo+ID4ga2V5cw0KPiA+DQo+ID4gSGkgQmlqdSwN
Cj4gPg0KPiA+IE9uIFR1ZSwgMSBKdWwgMjAyNSBhdCAxMzo0MCwgQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gTW9uLCAxNCBBcHINCj4gPiA+ID4gMjAyNSBh
dCAxNzozOCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4g
PiA+ID4gPiBSWi9HM0UgU01BUkMgRVZLICBoYXMgMyB1c2VyIGJ1dHRvbnMgY2FsbGVkIFVTRVJf
U1cxLCBVU0VSX1NXMg0KPiA+ID4gPiA+IGFuZCBVU0VSX1NXMy4gQWRkIGEgRFQgbm9kZSBpbiBk
ZXZpY2UgdHJlZSB0byBpbnN0YW50aWF0ZSB0aGUNCj4gPiA+ID4gPiBncGlvLWtleXMgZHJpdmVy
IGZvciB0aGVzZSBidXR0b25zLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gPiA+ID4gLS0t
IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMyLmR0c2kNCj4gPiA+
ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1zbWFyYzIuZHRz
aQ0KPiA+ID4gPiA+IEBAIC0xMiw4ICsxMiwxMyBAQA0KPiA+ID4gPiA+ICAgKiBTV19TRElPX00y
RToNCj4gPiA+ID4gPiAgICogICAgIDAgLSBTTUFSQyBTRElPIHNpZ25hbCBpcyBjb25uZWN0ZWQg
dG8gdVNEMQ0KPiA+ID4gPiA+ICAgKiAgICAgMSAtIFNNQVJDIFNESU8gc2lnbmFsIGlzIGNvbm5l
Y3RlZCB0byBNLjIgS2V5IEUgY29ubmVjdG9yDQo+ID4gPiA+ID4gKyAqDQo+ID4gPiA+ID4gKyAq
IEdQSU8ga2V5cyBhcmUgZW5hYmxlZCBieSBkZWZhdWx0LiBVc2UgUE1PRF9HUElPIG1hY3JvcyB0
bw0KPiA+ID4gPiA+ICsgZGlzYWJsZSB0aGVtDQo+ID4gPiA+ID4gKyAqIGlmIG5lZWRlZC4NCj4g
PiA+ID4gPiAgICovDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2lucHV0L2lucHV0Lmg+DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICAvIHsNCj4gPiA+ID4gPiAg
ICAgICAgIG1vZGVsID0gIlJlbmVzYXMgUlogU01BUkMgQ2Fycmllci1JSSBCb2FyZCI7DQo+ID4g
PiA+ID4gICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsc21hcmMyLWV2ayI7IEBAIC0yNyw2
ICszMiwzMSBAQA0KPiA+ID4gPiA+IGFsaWFzZXMgew0KPiA+ID4gPiA+ICAgICAgICAgICAgICAg
ICBzZXJpYWwzID0gJnNjaWYwOw0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBtbWMxID0gJnNk
aGkxOw0KPiA+ID4gPiA+ICAgICAgICAgfTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAg
ICBrZXlzOiBrZXlzIHsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJn
cGlvLWtleXMiOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAga2V5LTEg
ew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQg
PSA8JnBpbmN0cmwNCj4gPiA+ID4gPiArIEtFWV8xX0dQSU8gSVJRX1RZUEVfRURHRV9GQUxMSU5H
PjsNCj4gPiA+ID4NCj4gPiA+ID4gU28geW91IGFyZSB1c2luZyB0aGVtIGFzIGludGVycnVwdHMu
IERvbid0IHlvdSBuZWVkIHRvIGNvbmZpZ3VyZQ0KPiA+ID4gPiBwaW4gY29udHJvbCBmb3IgdGhh
dCAoZnVuY3Rpb24gMTUgPSBJUlExNCk/DQo+ID4gPg0KPiA+ID4gVGhlIHNhbWUgcGluIGNhbiBi
ZSBjb25maWd1cmVkIGFzIFRJTlQgb3IgSVJRMTUsIGN1cnJlbnRseSBpdCBpcyBjb25maWd1cmVk
IGFzIFRJTlQgSVJRLg0KPiA+ID4gSXMgaXQgb2s/DQo+ID4NCj4gPiBPSy4NCj4gPg0KPiA+ID4g
PiBBbHRlcm5hdGl2ZWx5LCBjYW4ndCB5b3UgdXNlIHRoZW0gYXMgZ3Bpb3Mgd2l0aCBpbnRlcnJ1
cHQgZmFjaWxpdGllcz8NCj4gPiA+DQo+ID4gPiBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwaW5j
dHJsIEtFWV8xX0dQSU8gSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gPiA+DQo+ID4gPiBUaGUg
VElOVCBJUlEgd2lsbCBwcm92aWRlIHRoZSBzYW1lIHJpZ2h0PyBBbSBJIG1pc3NpbmcgYW55dGhp
bmcgaGVyZT8NCj4gPg0KPiA+IFdoZW4geW91IHVzZSBpbnRlcnJ1cHRzIGRpcmVjdGx5LCB0aGUg
c3lzdGVtIHdpbGwgZGV0ZWN0IG9ubHkga2V5DQo+ID4gcHJlc3NlcywgYW5kIGZha2UgKHRpbWVy
LWJhc2VkKSBrZXkgcmVsZWFzZXMuDQo+ID4gV2hlbiB5b3UgdXNlIEdQSU9zIHdpdGggaW50ZXJy
dXB0LWNhcGFiaWxpdHksIHRoZSBzeXN0ZW0gY2FuIGRldGVjdCBib3RoIGtleSBwcmVzc2VzIGFu
ZCByZWxlYXNlcy4NCj4gPg0KPiA+IFNlZSBhbHNvIGNvbW1pdCBjYWIzNTExZWE3YTBiMWZjICgi
QVJNOiBkdHM6IG1hcnplbjogQWRkIHNsaWRlIHN3aXRjaGVzIikuDQo+IA0KPiBBcyBwZXIgWzFd
LCBmb3IgR1BJT3Mgd2l0aCBpbnRlcnJ1cHQtY2FwYWJpbGl0eSwgSVJRIGNvbnRyb2xsZXIgbmVl
ZHMgdG8gc3VwcG9ydCBib3RoIGVkZ2VzLg0KPiBCdXQgVElOVCBzdXBwb3J0cyBSaXNpbmcgb3Ig
RmFsbGluZyBlZGdlLCBidXQgbm90IGJvdGguIFNvLCB3ZSBjYW5ub3QgdXNlIHRoaXMuDQo+IA0K
PiBUaGF0IGlzIHRoZSByZWFzb24gdXNpbmcgaW50ZXJydXB0IGRpcmVjdGx5Lg0KPiANCj4gWzFd
DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE2LXJjNC9zb3VyY2UvZHJp
dmVycy9pbnB1dC9rZXlib2FyZC9ncGlvX2tleXMuYyNMOTgwDQo+IA0KDQpUaGlzIGlzIHRoZSBl
cnJvciBtZXNzYWdlIEkgZ2V0IGlmIHNldCBncGlvIHdpdGggaXJxIGNhcGFiaWxpdHkgDQoNClsg
ICAgMi4xOTE4MTldIGdlbmlycTogU2V0dGluZyB0cmlnZ2VyIG1vZGUgMyBmb3IgaXJxIDUxIGZh
aWxlZCAocnpnMmxfZ3Bpb19pcnFfc2V0X3R5cGUrMHgwLzB4MTQpDQpbICAgIDIuMjA0MTY4XSBn
cGlvLWtleXMga2V5czogVW5hYmxlIHRvIGNsYWltIGlycSA1MTsgZXJyb3IgLTIyDQpbICAgIDIu
MjEwMDE4XSBncGlvLWtleXMga2V5czogcHJvYmUgd2l0aCBkcml2ZXIgZ3Bpby1rZXlzIGZhaWxl
ZCB3aXRoIGVycm9yIC0yMg0KDQoNCgkJa2V5LTEgew0KCQkJZ3Bpb3MgPSA8JnBpbmN0cmwgS0VZ
XzFfR1BJTyBHUElPX0FDVElWRV9MT1cgPjsNCgkJCWxpbnV4LGNvZGUgPSA8S0VZXzE+Ow0KCQkJ
bGFiZWwgPSAiVVNFUl9TVzEiOw0KCQkJd2FrZXVwLXNvdXJjZTsNCgkJCWRlYm91bmNlLWludGVy
dmFsID0gPDIwPjsNCgkJfTsNCg0KQ2hlZXJzLA0KQmlqdQ0K

