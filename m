Return-Path: <linux-renesas-soc+bounces-32486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKtpJMAmA2qj1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:10:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258B520D35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 15:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3EA4302EA2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 13:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD5C3911C8;
	Tue, 12 May 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="f0CM7w5Y";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="f0CM7w5Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020118.outbound.protection.outlook.com [52.101.69.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA180372064;
	Tue, 12 May 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.118
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590838; cv=fail; b=KG49O6uMV1Pp4cZD7jgbKhTWVT1qZyDbPmYuUwhGR+ST7au11+l4LJnb7TntAo6jX5gEFBp8Sg1zDsTFOwurtjiWTPXg5F5cEP6RysGjq5VqZ7JvxhzkkmWhWqnpPeqQcRe1i0If+CEaJe/ezjSuzuGtMyXMdPebsAidMd7m/fA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590838; c=relaxed/simple;
	bh=937YqgBKibs5IhVHIYnUXP5ODR7wUlOX48ce01TIyHc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WLi4be/xtiojf0A7PTQ4QI6G2/iAbgbM6s70/hC9it8XDStfyDmYOAdltdSA2WAMi9N9ESzZDWcaHjt7a/TJ+wVp3+44uueah29bKsGWQLLfTTSp4q3JVwLEz69yXZ1eQlVmYGjVNrbo+pm1tHS9xwUhBJb/rf/MrhghyVuTfhU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=f0CM7w5Y; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=f0CM7w5Y; arc=fail smtp.client-ip=52.101.69.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h9PHe7DTrTgmDyB7O6nRb4OEe81+2GovfSiRndQlvk5V6PducTpHyKMaAFFjeddDeY4/HdfrbTtevW/rATKo8G2fI3XwA/2F6ux5meFQFjNsStTKVV6Av8DnMb0lxlTqr7S6Q0HvySSdnr3JeXrHmp2uQI1ZmZfqy4PFfEvtit/4Ooc3HVzrS5dJZa4GJWXNlKstBugT6kp25qaiCnVm6aaMsuWfjFpFDUz4pncwN3vL1Tmi035GTzgTs1fTx2huNuq2M9GaAS2DmOAdjmAc1iixzXpSTmuCD/CL7MkrwX2fsVX5LrXgnAkhBhHYeuvle6RMcdhNr9BFBA6lMZNv6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=lOw+J791l0bwKc3cI6M9fAtDgyTJeqSNeOwV/PH/N5yGobprXd70lRMhqk9YMwi8RPfzSRYDlgJsHEyQntO7LZU2yYI0JD1u78Diui7nvzUTGzIWFk96px9JGLe6awmWYmYwmAFIE2psYAntBeR+yjUU/jq9KISI34YQyqwbzZQgECQ7O7Ai2wfcosUcj6IvRpv4woRfiFRsc3ohxD1pj0V8TvoIr2WrMNubAQBynFi3NlD5AGtVz7aALWBUzOHiYiFJCjvjVfQDY/x8E/b/ULsY05IeZ6TDxatLoTX9B6j6eus5uRn2dEJfNWHwHPs513ZrEqCz3DNbwJ0tQcjVRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=f0CM7w5Y2Q0CXctHD0YGrmq/xZDcUAOoU/wm3G3cvkY3Vj3HAcqhbCYsT3sCyaQkL0fUFxa/JzReRpCqEBZ8WsxgN/4xJ03Z2XW43fqwIkUXanFpe4sumDuMIAFIvwAhVimkW7/dFwNXs086zll5Hy8o2+/bIF6/oGmD1EqFKLNpuBHIrKEngI9KuPUpAOKDhvi9NVHeC0lBrFE6HSRo2DmIZwgsLIJtbasKBTkLB2v053CLLNJ7Rf3fVfuphVkAzGJV3jw9FLibhszn3yds12XDdz0VQkvXm8+l69Q/qntVekEDIslcVaezwajWIOdGdTnCYUWy2D9LwzCTnYTynQ==
Received: from CWLP265CA0535.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::7)
 by GVXPR04MB10707.eurprd04.prod.outlook.com (2603:10a6:150:214::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:30 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:400:18d:cafe::f2) by CWLP265CA0535.outlook.office365.com
 (2603:10a6:400:18d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 13:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 13:00:30 +0000
Received: from emails-9587203-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3DAD37FD6E;
	Tue, 12 May 2026 13:00:30 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 13:00:15 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8aiErKEVQ8R5nFkPJCbL0Sz2+4AngJjetsse0gsjH3ybuPRkRh7t+GOuQC15lESq1axp2W7BzYRiAmGezFHIAxY/IaeLvhe3HmF0291aUbUC9NKvMEWNsmcaJlDagHgBVO1pb2V8LSa86OgSxk0IWhT5kZXBZ0i3GygUKgFGlGJG5/ETN8BVhIqCfx4WE+24ZYAoln+R28BHwAHZBVjqy1g8956tr77yFPu0qxZvWGdLFYRE7OvQ16fF6bLNeVtq3ncvijEZFuOhJPKxmNqYtB1Z95a6yRpRDJJh++dBTklqJvyyoX0qbVRHH3mLX9F4C29EIINzqeV8tW8rLAJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=xA8OnFm+btRycHzB3gtTI1F/4H2+kBn9D5RYXwbZMF4MC/LVbfu2quCk8sQhAQH4pxNAQ+YjUFCVaqJMtxhIcpiOwwENQAF5iAa3A2+PLRHyohVbWKUfFTFF3o1OWJaeml7m2xnq9aT1WHTrrWTZ0gFzO0/3em8sdnyvuwuEiVu16VbC2vFL5J+6pul1mKZ4+y1wo5v4gKx/aYsGmQcxCXdAAMsnmztX+bQ3pmS46cIELKQNDz5hbUFxkIFoN+rF8vVV7eDbbDKruH3B93JAteMTLPLXo03FLFEgPn0CWswQT7ev7ePhVmYtAohKgkI8p0RscrKqpil4HbnvjlNMug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=f0CM7w5Y2Q0CXctHD0YGrmq/xZDcUAOoU/wm3G3cvkY3Vj3HAcqhbCYsT3sCyaQkL0fUFxa/JzReRpCqEBZ8WsxgN/4xJ03Z2XW43fqwIkUXanFpe4sumDuMIAFIvwAhVimkW7/dFwNXs086zll5Hy8o2+/bIF6/oGmD1EqFKLNpuBHIrKEngI9KuPUpAOKDhvi9NVHeC0lBrFE6HSRo2DmIZwgsLIJtbasKBTkLB2v053CLLNJ7Rf3fVfuphVkAzGJV3jw9FLibhszn3yds12XDdz0VQkvXm8+l69Q/qntVekEDIslcVaezwajWIOdGdTnCYUWy2D9LwzCTnYTynQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7934.eurprd04.prod.outlook.com
 (2603:10a6:102:ca::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 13:00:10 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 13:00:10 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 15:00:05 +0200
Subject: [PATCH v3 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-rzg2-sr-boards-v3-1-f033fc96c906@solid-run.com>
References: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
In-Reply-To: <20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|PA4PR04MB7934:EE_|AMS1EPF00000041:EE_|GVXPR04MB10707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4c7257-8643-416c-2b15-08deb026724d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 LkaHUMGaPPG1bFFhZp9jUDfiTVZb6RfUlFhI1jUbGmki8RPdbo5c4/KkX91OLauWFrVjCFKMQq5pKi5qAImT3o3n702MGDr9CySruf2Kk4vF1AX6KJvn7QEetMHHUTb0whAo8okcht3mO69O9/Ajux+79whsDJme1H8vSRPetzcJfzscqPGMZ7si3RC3gw6z8DevNDJ7o0hXF5WrsCNV9o4hy4CQDK1w4hmSQf18Lz+dr7TpzGlzKVXlUuEfa8WExGfV2PDmzZ31iyjRsSIJqxy6d8UoWJKrjl4cjQH7ZrQCvQNgBnjXMtR/wiIb8aqUDVJwTHLrpp/Uxe6BNx39UDhH9QGnNPjOgLXpvl6fHJAnbGU/CeHk1E+jJiOBsc4mkqtzoST4gkd2U4ByP1gcc1dQj+2xfBNfYyd9Y0nmY5ViSr+aJokJ0KM9dq7CbsDxyKZf6/eecbl4bkfK9trY/k+eLvYzZVtjUKG/kxKcLbfWK+0XeF2d1qiokqcDvSmKw6rUHzbnNcCpB2yB73QGMOdSuO7ugMbZWv9yNBhkk/e/aPSG1mV29dhp/xQZQ8xnUtmqDRpB5Anh0Op+EOoCBwEcW84OWZ/iyEDXALSXHnKRu6ca8IfYakY/DcbReivOfyJ2omxvyjazoESJDUz30crqI6xfv3UB13f3Twigdk83G0RqH5OeWMbsVyrpQEOs9FJP/9G9DchoWTIQPwMTt+gzEums2lNZnaUJpVIXeZec2QnXeWkg9DY22n2mtD6h
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 gx0wtUvZeF9eV2J6BQHtCC347gTs1SwvJ0DxCrHnnZq5IdMfAI7meQ+QHc3ekRfTPR3HcvCFOmWq5Lqp50QHHj7ggu+QYlSWxQ+td+dNmlGKUQO+gs12SBOs3VkokHOVlvNA+TgattGAKqNV9WMZRwJuVvgwDCq3qoGPRTaG0BV6+zfnPpFZqjjvneZESqp/ye/l9ZWSlbGTOUho0Uw+wF3v/fKsbhWYJjfBHKNfI+PrXSlUiqWRoXCklMVvttOC7Tz/FWlprAXJVqhcQOPCvPHTREChMcyqJPQUX1ohaZvq7rXdAWRXywdnnRNiCFcb6DsfnfzE3nui8qfsotrMvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 55962bc22b4d4c26b3106fd6ebead690:solidrun,office365_emails,sent,inline:7a8888ac466080aa94ee14b06e0b315c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6df574b-9545-4912-9600-08deb0266627
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|376014|14060799003|36860700016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UvDCeCrcxDSqEt7qZB4YAmZ/9snW2xAuRCCg6Ho0kzdLQ7HYbk6sTjmUPzMVCKw/TA6Hu/Jx5guo9bbR2ydUy2jjMl2klhZQoEBz/28tHmOuI+6HW4KjXwSvyXgTNtx8NRQZStCIkAHw8UC7hTdcG1DWhqsvjApEj6278FD7LYl9bueaVenQ4OVO17FE/R6DdYgtH3hfb0vW+ZYlhl3ekdH201pudYNBnNXpmsSmxRApfj6b01jWiTZbNO04nwEwn+sPPlMr6DGYkDP9eRlyijzEft3hldu5eQciGhVy8Yv4Zpildd2h8VvPVsdh0gZ4ACymuNdqaWx57+2kms+rmpnSopj6B/3XLX7EjioaDIAS5jDm1N2XGANyAXmvQBZSxAZuHssUuM9H4VooPczqrATXQpbcFc5kJbjTS59CHpTO/oTD2s0i9uhDmVBwf4ZK7soIwXkEbyaM5uPXnOE833N8AMAJzd0P9mWEe+AvDBVJNEGOlkr7xdi2wZfGFjtAZMa0rgEuamfPuheTh/fN4TNTIf7uq6tvcmakulM1JaziXr8JKaiarra56/9KpQJwXeiExumWqfrFP3oN8ZnQ0vj207slAEcVlrpeYCx5Z9/qSdglznQfT3GZSKS44EDlFyxOFvcd85WMveW0lCKhgXSzq/ArKtWHTI1Hf8THtJvze2MVYi3nouq9cei3pRMybbolFjOzfsE9zsnN1RVuphjwrCYy0LA/DtlIGyS/7ow=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(376014)(14060799003)(36860700016)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cCvjUnyaEjRhA8mOBqFXqHtGcpFIHCv7c5k2cQn9hVLMICn57gAa3aAJ5tLRGvTkaIBff2SZqtf05VXuY+qAl4FxV5xSMQsJPVZ0zPKgswLN+DJ4Yy5CuiDcEMKwNjB8uMlDI4vmU7Sd3RUTIcT4pNEoWntxmXEsL5o0B4UZWn5SmU+vjR3un+qYSJqEilDIYfr060yRb3wJO6h4hnZWttdeuEe3qwMX57hZXNoTZI1fzjhnkEBAP38HwvIqHfRmD3MqJR1RYm7rryo3ZMPkZTzmrEv09fNFg7wRaQ0z4HtXJcCRX9v+7DSt8WpvLrYssf6RR63TPvJoN0CQlMw/EZz36irrS9eluqand0VJ57AKz3uXyhqqerYLVYgLXR4Wyum5fPLVIKeFVkpiUH5gYyXDK/7TwTBCW9L0xPIUNeiIjlJF+ZfMGNYnk5yOY3VU
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 13:00:30.5092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4c7257-8643-416c-2b15-08deb026724d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10707
X-Rspamd-Queue-Id: 4258B520D35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32486-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM [1]
- RZ/V2L SoM [2]
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM [3]
- RZ/G2UL SoM [4]
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
- HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
[6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
[7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5c22c51b1533d..889d4c5e8cd1b 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -502,6 +502,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -513,6 +521,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -529,6 +556,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.51.0


