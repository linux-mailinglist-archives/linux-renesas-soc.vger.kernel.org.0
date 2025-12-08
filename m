Return-Path: <linux-renesas-soc+bounces-25643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 902FCCAC8CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 09:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8D6830019CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 08:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F822DCBE0;
	Mon,  8 Dec 2025 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="C9X8b6vI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C262DE6E6;
	Mon,  8 Dec 2025 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183879; cv=fail; b=OcbZubEHTNsezrIXwR7FY718Xali4GR5FZul3TKeCXImcpEG0x9OEqLfrLBp8AhHuKoPN2XmzxThgTZfbWBorgK8WrHpKw8vMA38RqKgfSVS9gZMUV/6i9bHVDzyxSC7Z3jsfnPDWA6jFZhL4UsBuMSOQ4hPYXqetD+SajDGikw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183879; c=relaxed/simple;
	bh=43vbDL/+97zg7PdZXwP4X8jcN7Bywha+fI5xM6dnetY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kGJoODJOyXF8pV8ysg/dXHTFTP+hLcbdhmlAU3JjKbcNZ5kbiIFcMX7p2A+JMZlAYJKsFAn6JVEicrVi2493q+fVjD1E9WKAa6G6HYBNH3zaivGJmCcdOrwBaj/48je+SITBEuxUmjkILAhp5GtzEKl5o1jxCTVRxmZPFXiDJ3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=C9X8b6vI; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZ4UdOnu7mHsbPUw8B99e/Z0c8ao2V5L5DwzM1Zbj52NY7VLplW+J+f55WQaBWO00NU/Vpi3QrA+QyWK35qg4qUKE95ZMc+pY8Vk9SJu/JsSZz+HZfcYO4OlH+qp7xQjKVheQGBqJ0lO9Wn6KM6XHqZJacvca37oMLUqjg9FjwtL5yWJ2efQl3RLnrU0RCLcxyhRz4ry+aX6h4FINwY9YLB8yx3unG1fDZ0qBBXT1wAYDs+i/LgXeZ2cV5GRHluFVEeGENB9bF5j7UofvTg9XfksqjLr2pQ5en+MEhBSujJgPYi/Avu5SZLBxq11Noq1UKiE1WanQLt8outH38iu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43vbDL/+97zg7PdZXwP4X8jcN7Bywha+fI5xM6dnetY=;
 b=XjuXXz3WqDcnszpOQ/CW1w1jQtb11Yb95Z7BKT1CM6/Fvf4OogEox4RsY5NXzMTHiHCz6yan2De5RHmZkYDGytFll3IYew9ZhjYncP8OckCucEo4LFxtmLDLFxoouNtaV9O7Qrtx1F4UeVNvY1re4H9eTpWz3VeyN3BeCYaDQykNPVks4IFqjTz/dCdegme3y18Xs1H7upuUE/nAPHUnWV5KNdJip8yH3UTjCnSJEEF5nH8yoHKxP8tJnBhuqhFrbgOeVBwSQ3jcTe0Lp0OyKc6PzkJ5257cWin8pSsaCjDXsO/JE3VR3J78skpBHgtn1Ianestd80ZFHnlSikrNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43vbDL/+97zg7PdZXwP4X8jcN7Bywha+fI5xM6dnetY=;
 b=C9X8b6vIhwrH5eL74g/6+BoXFv0KN7pFBbC50YPqzOLg9+15Rf0qBkVZOVsu0Sf5xmSmR+jU7jyoyPMKd+Iag/OSf1eZEw09f6wHte0YwsmV5Ij76XqYhyUY480GS1I4ElWVECuhjU9DE2+nerH9jhYtfxh4oy0wHArENd+Wu4s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11727.jpnprd01.prod.outlook.com (2603:1096:604:230::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Mon, 8 Dec
 2025 08:51:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.005; Mon, 8 Dec 2025
 08:51:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Alan Stern
	<stern@rowland.harvard.edu>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Topic: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Index: AQHcZ3fosvRmsVoD4EmZfZBInM+QcLUWYDsAgAD36rCAABPSAIAAA8XA
Date: Mon, 8 Dec 2025 08:51:10 +0000
Message-ID:
 <TY3PR01MB11346B7324A85E25EBD1EEA1886A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
	 <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
	 <TY3PR01MB1134603CBC4385178E2E57E3886A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de>
In-Reply-To: <b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11727:EE_
x-ms-office365-filtering-correlation-id: 1118ad65-9ca8-495d-8050-08de3636ef9d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnZSREdHekhJOUFZb2xEcDljOEhNUndmclphRFBZQzk0WHVweEs5RkhGRVR4?=
 =?utf-8?B?WDFBZjJwRVdpaXc5OXlKRDJVbXRPeU5lMUtObWdJWUVJL2xuTm0zUlFUSUI0?=
 =?utf-8?B?eVBwSWNCMkg4TXduZitlZW9oWm9DemV6RWMvRnkyVjZtTTN5Q2JoSkFqN3BD?=
 =?utf-8?B?bTZSd254OWhEdHo5OERTYUF6NC9WME1lZTdQdndnL1J4c2ZISkxBYllwN3BC?=
 =?utf-8?B?Z3ZBMktxT1NBanpQZ2dlSUl6cFI1NzFwR2Vqd09sV3U2ZWlMUithVVVuMld0?=
 =?utf-8?B?VnhLZFg0MGIwVmtjam80dCtHR1loZmdUS3U3K0Z1ZUlBUE9kR1pLdGFBOGhs?=
 =?utf-8?B?U3lOZkhvZ3RuL2grNGhUZHJ6ZnBtSENiaHZ1a1JOTXZ4WThNVklWVjNlOTB4?=
 =?utf-8?B?blA1Sk5DaUE3ZkJFYUYvUnpidFlUYmZycHB1VE1RSGRKeUlUb29VbjNaMWVC?=
 =?utf-8?B?UStYelkreCtvc2ZjSnBGTEpUZU4wbThIZW5JSW8yR3NLVndTR1lYUDFpK3Z2?=
 =?utf-8?B?Qm1wd3ZCT1hHU0ZLUytqNTNlSzZVZC9QUWd4S3BqbDd4dXVPNUQySTI1Yzdp?=
 =?utf-8?B?STBUWlBmNTl3Q0c2U2J6d3N6WGlMa2pMTnhodWtoS0laM0R2bUk5UE11TkJ6?=
 =?utf-8?B?NzB4WUFuWnR3RUJEejNDWHd4RlN5VWdacHkrUnVvdmhIQ2t0WS9aa3E4OWxL?=
 =?utf-8?B?WFRGb2Jza01TbXgrckhaWS9SKzVjTTZmSWN0Mytmci9NV2VtdS9uSldTcGJK?=
 =?utf-8?B?eG9ibkpJWmJMcHBKck8xMkpMMnhsU0ZCQ3ZEdjVIOWVPQjNDYlI1cWk2YzFJ?=
 =?utf-8?B?aUp3MktQanRTQWtQTVV1K1d2QXRwaVNlUFplTFJGc2xlZWZoSC9lY3pEWkJZ?=
 =?utf-8?B?Y1lHQ1ExbnRTL1Iyakx1bUtCa21MaXQxQVFNLzZ4SFQyVlNLdEdQODF1dWwv?=
 =?utf-8?B?YUt1d0E3a1ZWcHcxVWZITklxN0V2M3dnQ2pLcEo1SmsvVnUzUDdQV0hCZ3pG?=
 =?utf-8?B?Z2tLS00vMmFJNjM4UGNCL3RxUEJYalFoOXErYnZOUnVjTHV3WjFBa2Z5T0lZ?=
 =?utf-8?B?cFA5VSt6dkVCSERYdUxqb0tSQmc2WGljaU5mZ0p6VmZhdzFVdGU3ZS9oVHBN?=
 =?utf-8?B?V01lSUJIZ1JZY2ZjcXV4cXpEd3VUM0VYazc3Wkw2cjlCeXIyRUgrTDBwZmVP?=
 =?utf-8?B?cDRINFp0L0pkdFlWQXd2Y1R2WVR3bzQ5TVJ4ZEVHUUJEVEN4emlLVVV5bTVq?=
 =?utf-8?B?ejNQb2VMejYxaGFBQnlmNm02Wmp0VGxIRUxTSm1md2V1TkVsNFdOT2hpYnRr?=
 =?utf-8?B?MU9XNllhMUtQWmRkdjB3U0p3SmtDUExyeVozNHlzTmJSaUR6MU1zbVJGTkgy?=
 =?utf-8?B?anJ0V1NaSHVNdmJrUC9ObjNGQ3RTcVFGdlR3TTdRRjR2OUMrZDFRWUVwaGlz?=
 =?utf-8?B?RVB3dlZkWWpIS29vUk9yZWpYRUIrR1pGUHlqYThuUFZSTXhUNjh1Wi83Wjk0?=
 =?utf-8?B?S2Z0YjUxTnBVTG12elhiRUZlVGN1U0xtdkxpT0FXMHZiVzhocjdwS3A2OHhw?=
 =?utf-8?B?QTF4MzZ3RzhETklsYXM2Unk5SDVrL3NzUU9SWHJ5M0wrNjZoOEpqZE01bnZq?=
 =?utf-8?B?U1BZTVJFb2NjY0NlamxYamVxVzB5K2VEc0RqWVlPSW1nbnRHUEtYZGJkYmJi?=
 =?utf-8?B?UmFzVEJyUXVWTXlpN1IwS3U4MHBXbmpwL1RnRDVRQW9FWVNBUVA4Y0s2TDBN?=
 =?utf-8?B?akRTNFhBbERnbnViSTB2RVVRdGl4M2NKOXNRM3hObS9pMFZtbWlyaGxnYXVS?=
 =?utf-8?B?ZUFaNk4vU0NCOSsrTFFKcHFhdG9BaGdwM2pXWFVQYzBBbE9rcnBjNlJrU01D?=
 =?utf-8?B?am1MWnNLdWVzOGgycWhkUFNvemc4c2pENmdyV0Y5T0tyZFVTYzQvbkhVcmZZ?=
 =?utf-8?B?R3crdlhubXlmdUhHbzVVYWZNeEllYmFUcTlVZnljMkhSNmcwdW51TU5QWUE2?=
 =?utf-8?B?UTdFRW55ZTBnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?elVkVjdUR2p6SHRoNWRFeGdRVlZYUHVucm00eG51WjhhcGRYT1R4cHRsRjZP?=
 =?utf-8?B?dXkrOG1UeENlVjlDUDRDeCtyKzJQVHo1NzlXVnYzMG1NZWFmVkRIbml6eG9T?=
 =?utf-8?B?QUJjQlFPanVtampUdTVqSjJLMUIrZFNBT2xYWi9ObG5HYXRsQUtWWklTMDBI?=
 =?utf-8?B?eVhHTnNoMU9DZ1BidDFtZzRXWERvNk5MNFM5Vi9iU1cyVG5QWStnRU5PWWRw?=
 =?utf-8?B?alBBQytXOW5iUmZiZjkwbGFKNWJIV2xxRW51SVFLSHhZb0tsU291d0V2eWFD?=
 =?utf-8?B?NjUrTzBQOEFmWnlobmpVNmpIMnB5NWxQN05XQmhuV21WZXhpRVB6VVcyKzRU?=
 =?utf-8?B?VzE1RVNBa3FmcmtiakZnK0hkaFFBRHcxbVZadGlzbmw4STBxQUZPVEVETDZy?=
 =?utf-8?B?WjRqNU9NQlZ1WnBISEdLWlh1ZmhBL3FZSXRXc3c3TlNhbXhiYkNVVU9MNDMx?=
 =?utf-8?B?THFHSUxtK29MMmQvY0xQT2NIZDRxTThvbTlQUjcvS3d0UDJJVFJaVzUzM1Rn?=
 =?utf-8?B?cktmNVVUNW91aDNrb1ViZ2FDL2ExNlNnNno4T0UvOHNSQTJkZjBpQ2Rva1Ev?=
 =?utf-8?B?YWZpTjVrWnpZWDljaUI3NWFYUTBKOHhrWHloK0JVa1F6M2hjWU82ZkF6dDNt?=
 =?utf-8?B?OGo2bmVZS0JLSmp0ZFFlOTN2L0poV1hRWWhVYW1iM29nd08xSUNLbjlFZ0Mz?=
 =?utf-8?B?TmVwVXhZMStnd3V5LzJQcERMV0RQVUd6N1JPR3FSL3RvSFczKzgrd1Z0eHFN?=
 =?utf-8?B?NnF2KzZ3RVRFMTF0Uk5xWkRpRStGd1o5eHp2bkZWR1lqWGRTZUxCdGhsMCtU?=
 =?utf-8?B?akJqbXBYUkJOSWZCWjQwSmkzbE9uSEJWQ2RrYzR0cFRNWW1CME5TdWJCam13?=
 =?utf-8?B?OWJHSEUvMWYzQzN1b2FiSDBKRzQ1WS9BU3ZxU0k2ZCtic05ncS9mLzJ6SGVU?=
 =?utf-8?B?cUdjSng0MTVDZCtzZlllQkJxbzZ1U2Q0aGNnLzI3WG92RFJjTEt2QW41U2ha?=
 =?utf-8?B?V1FzeXlpbElSS2JJeEZDT2hMbyt0VWNiemRXMVhXancvTGhJQmhaOC8vcG9p?=
 =?utf-8?B?L25LeFlONC85RjlndE1yL2dYTXZ2YytMbDFkU2hpY09MUHFzak5SRGJxL3k3?=
 =?utf-8?B?M2M1aldvcWhIMVVvZjNqR25RRkI3NEFXTjh0N1RmSWUrNCs3c2tncCtIRG1M?=
 =?utf-8?B?bEZHRzlHSjZyeFBSeWx4cVZQeVpPN04wZnZnMmhhajh0eHR2UXVTUC9DdlB5?=
 =?utf-8?B?ZkNaSGpQRjdHczBYS2tYK2pwd0prTmszbVBNSDY2ZEhEaUxydDI5THB4S2ZP?=
 =?utf-8?B?RkM5L05vNDhEUS95YWg0ME5lTy9vRVFCbkJOamdGMFk5WTRQMXJNbUhyd2pG?=
 =?utf-8?B?TVJFRUZmUFdLZEM1a1FLQjdjMmFkK3RheVVKMEIxck0rL0pkRjl0NjZ1UFRT?=
 =?utf-8?B?ZEU0QUZRNXNwdDk0Zk1sWVgrWEpIeHBKbFJlUkd4NUJ1VFd0MWk2Nnhzd1dC?=
 =?utf-8?B?S081QW1oZ001aFpaZWMwbUpHT3RlR0hYSkZKVElqUFpLT0MxdnBFalBMQlNw?=
 =?utf-8?B?WTVkWEZQcnh5UGdTVWtXUU1TN2x0QksvQ1plcVp6cEJNUkVpVFdaWkdyM2Fo?=
 =?utf-8?B?RzB5MThteUtVY2lqVExua2oyK0hscXNpam01WjdrYXNLa2V4Mk5GaWVTd3ln?=
 =?utf-8?B?TlR0MEdFVWRyTUMvK01BWVhHOU5uMVFkNjhud1Q1M2VIMFdrVTN6V3dsMnFB?=
 =?utf-8?B?d0FDMGxNcGRaVXNUa3pGWEpKL0gyMldhMlZKRkU2REgrRmYrN0lBd0hIaHRv?=
 =?utf-8?B?eHFkcTkrT1l2VHF2VTZRTjNWRHY5TElLcmphOWZaODgzWVlGUGhYWTU4eFli?=
 =?utf-8?B?ZTEvY21UU0E3N245bVpYV25wS1dNTDJ1U0hjT0pDN21MY3pzMW5rS1BXUVVR?=
 =?utf-8?B?em5RaURDajhoYUhIMWxVdWFZQmdzeGZINjdpRzg3VzEvSnVtTVJKWWozcmUw?=
 =?utf-8?B?cWl0aW5wTGFFVHdublRpN0F2YzNRSVdHM0RDek90QVRYUnptY3hNTjlvNHBM?=
 =?utf-8?B?OUNTRER2OFIzZ1VTQjF6WHpiR3BzSTduUlVuVHhFK0lVamphenV6MUovMEtW?=
 =?utf-8?B?bXlxSDdaZ2JVOWdNK01UMDR6NkhrK3RKWU9tR0g3TlJRMnZXeTJIVVNQNzlJ?=
 =?utf-8?B?YlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1118ad65-9ca8-495d-8050-08de3636ef9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 08:51:10.8810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaB3Gryqn4bGMafhTf9tK5RLmg81gV3wlFReXGkdhQvmNwV/yTUw3MvpdIBltz7eHcA8lFXoyOk7nMZHmmhKQn8rwOOOAoHpyZYl7vCmlY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11727

SGkgUGhpbGxpcGUsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+DQo+IFNlbnQ6IDA4IERlY2VtYmVyIDIwMjUgMDg6MzQNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAwLzJdIHVzYjogaG9zdDogRHJvcCByZXN1bWUgY2FsbHMgb24ge2Usb31oY2lfcGxhdGZv
cm1fc3VzcGVuZCgpDQo+IA0KPiBPbiBNbywgMjAyNS0xMi0wOCBhdCAwNzo1MCArMDAwMCwgQmlq
dSBEYXMgd3JvdGU6DQo+ID4gSGkgQWxhbiBTdGVybiwNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xhbmQuaGFy
dmFyZC5lZHU+DQo+ID4gPiBTZW50OiAwNyBEZWNlbWJlciAyMDI1IDE2OjM2DQo+ID4gPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDAvMl0gdXNiOiBob3N0OiBEcm9wIHJlc3VtZSBjYWxscyBvbg0KPiA+
ID4ge2Usb31oY2lfcGxhdGZvcm1fc3VzcGVuZCgpDQo+ID4gPg0KPiA+ID4gT24gU3VuLCBEZWMg
MDcsIDIwMjUgYXQgMTI6NDc6MjVQTSArMDAwMCwgQmlqdSB3cm90ZToNCj4gPiA+ID4gRnJvbTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPg0KPiA+ID4gPiBB
cyBwZXIgdGhlIHN1c3BlbmRfZGV2aWNlc19hbmRfZW50ZXIoKSBbMV0sIGlmIC5zdXNwZW5kKCkg
ZmFpbHMsDQo+ID4gPiA+IGl0IGludm9rZSB0aGUgLnJlc3VtZSgpIGNhbGxiYWNrLg0KPiA+ID4N
Cj4gPiA+IFF1aXRlIHdyb25nLiAgSWYgLnN1c3BlbmQoKSBmYWlscywgdGhlIGNvcmUgYXNzdW1l
cyB0aGUgZGV2aWNlIGlzDQo+ID4gPiBzdGlsbCBhdCBmdWxsIHBvd2VyLiAgSXQgZG9lcyBub3Qg
dHJ5IHRvIHJlc3VtZSB0aGUgZGV2aWNlLg0KPiA+DQo+ID4gQnV0IG5vdyBpbiBlaGNpL29oY2kg
c3VzcGVuZCgpIGlzIGNhbGxpbmcgZWhjaV9yZXN1bWUgd2l0aG91dCBjaGVja2luZw0KPiA+IHRo
ZSBzdGF0dXMgb2YgcmVzZXRfZGVhc3NlcnQgdGhhdCBjYW4gbGVhZCB0byBzeW5jaHJvbm91cyBh
Ym9ydCBhbmQgcmVib290IGlzIHRoZSBvbmx5IHdheSB0bw0KPiByZWNvdmVyLg0KPiA+DQo+ID4g
Rm9yIHRoZSByZXNldF9hc3NlcnQgZmFpbHVyZSBjYXNlcyBpbiBzdXNwZW5kKCksDQo+ID4NCj4g
PiBDYXNlIDEpIEV4Y2x1c2l2ZSByZXNldCBhc3NlcnQsIHJlc2V0IHJlZ2lzdGVyIGJpdCBzZXQg
dG8gYXNzZXJ0LCBidXQgc3RhdHVzIGJpdCBpcyBub3Qgc2V0LCBzbyB3ZQ0KPiBnZXQgdGltZW91
dCBlcnJvcg0KPiA+IAkgIFRoZSBmb2xsb3dpbmcgYWNjZXNzIHRvIGVoY2kgcmVnaXN0ZXJzIGNh
biBsZWFkIHRvIHN5bmNocm9ub3VzIGFib3J0Lg0KPiANCj4gTGV0IHRoZSByZXNldCBjb250cm9s
bGVyIGRyaXZlciBzZXQgdGhlIHJlc2V0IHJlZ2lzdGVyIGJpdCBiYWNrIHRvIGRlYXNzZXJ0ZWQg
c3RhdGUgd2hlbiByZXR1cm5pbmcgYQ0KPiB0aW1lb3V0IGVycm9yIGFmdGVyIHdhaXRpbmcgZm9y
IHRoZSBzdGF0dXMgYml0IHRvIGNoYW5nZS4NCg0KT0ssIFdpbGwgZG8uDQoNCkN1cnJlbnRseSB0
aGUgZHJpdmVyIHNldCByZWdpc3RlciBiaXQgYmFjayB0byBhc3NlcnRlZCBzdGF0ZSB3aGVuIHJl
dHVybmluZyBhDQp0aW1lb3V0IGVycm9yIGZvciBkZWFzc2VydCgpIFsxXS4NCg0KDQpbMV0gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTgtcmM3L3NvdXJjZS9kcml2ZXJzL2Ns
ay9yZW5lc2FzL3J6ZzJsLWNwZy5jI0wxNjcyDQoNCj4gDQo+ID4gQ2FzZSAyKSBBcnJheSByZXNl
dCBhc3NlcnQsIHJlc2V0IHJlZ2lzdGVyIGJpdCBpcyBzZXQgdG8gZGVhc3NlcnQsIGJ1dCB3ZSBh
cmUgbm90IGNoZWNraW5nIHRoZQ0KPiBzdGF0dXMgYml0DQo+ID4gICAgICAgICBhbmQgaWYgdGhl
IGRldmljZSBub3QgdHJhbnNpdGlvbmVkIHRvIGRlYXNzZXJ0IHN0YXRlLCB0aGVuDQo+ID4gdGhh
dCBjYW4gbGVhZCB0byBzeW5jaHJvbm91cyBhYm9ydA0KPiANCj4gVGhlIHN0YXR1cyBvZiBhcnJh
eSByZXNldHMgY2FuIG5vdCBiZSBjaGVja2VkIHdpdGggdGhlIGN1cnJlbnQgQVBJLg0KDQpPSy4N
Cg0KPiANCj4gPiBJIGd1ZXNzIHdlIHNob3VsZCBleHBsaWNpcnRseSBjYWxsIHJlc2V0X2NvbnRy
b2xfZGVhc3NlcnQocHJpdi0+cnN0cykNCj4gPiB0byBtYWtlIHN1cmUgdGhlIGRldmljZSBpcyBp
biBkZWFzc2VydGVkIHN0YXRlIGJlZm9yZSBjYWxsaW5nIGVoY2lfcmVzdW1lKCkuDQo+ID4NCj4g
PiBJIG1heSBiZSB3cm9uZy4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4NCj4gDQo+
IFRoZSByZXNldCBjb250cm9sbGVyIGRyaXZlciBzaG91bGQgbGVhdmUgdGhlIHJlc2V0IGluIGEg
ZGVhc3NlcnRlZCBzdGF0ZSB3aGVuIHJldHVybmluZyBhbiBlcnJvciBmcm9tDQo+IHJlc2V0X2Nv
bnRyb2xfYXNzZXJ0KCkuDQoNCkFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

