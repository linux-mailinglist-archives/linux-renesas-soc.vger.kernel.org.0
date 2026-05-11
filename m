Return-Path: <linux-renesas-soc+bounces-32370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIUDBqSxAWppigEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:38:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0F50BFDF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EDAF53006822
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0713D9028;
	Mon, 11 May 2026 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="huYquYbw";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="huYquYbw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022125.outbound.protection.outlook.com [52.101.66.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A663D47DC;
	Mon, 11 May 2026 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.125
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495899; cv=fail; b=FhKXPa9DcEfoK62Jmj6lupDKoHexk1ahQGQ54/qh1yiOkeKv5uayJjay/2OpV6lf2KsXiS3DbNws5WyhHneM/bVEC/tzFzMriqIa6q+DHwX8L0ZQxML6moi8olw+vCP9fXx/Fmlbkf3J2WEwywUOiB0CyrW2FtJwKE3Bc+FtH88=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495899; c=relaxed/simple;
	bh=tWNXsGro308O+S0iU70rgKCFhgfm3sfYq+rKSl1sGkY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=HkadglCJuDxYhxnyBiIAr5HM7i/EAWJv65ZgNCaynaoi99AHez0DTXM+JTMhPgeIXXSCuqA9kbVn0IHVz7XSBvwq21qH8JT5ZKBTy/hJGPrjbAxptpyGXW9j+lltPJpwV0+ULwxfucaBtqoJi/Main2YCZRxQhh88nM79DH9iB0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=huYquYbw; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=huYquYbw; arc=fail smtp.client-ip=52.101.66.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FTelDB+dLiAPJT1N/TVJKJDj3k1fwxMEz4gzmh+AbbhfueQAjsMKmTKN/1BMv/Qdkku9DcFYWo+6bTqRrJBpxUmaMnaW0XgqEe2WGS7P631z8WdkoFpcA8z6a4PdffkDYx8Qv7jfUg3h8DrZkk0uy4bEn5lb5WfGm3YQGsph1qhKuQSRQNVtX/Wx1UwE7c36QDGIhtUHAWi0AyTRHJOCgTqeUgXA3JoXeF8T86UQnBQfypJ7UO62xtJA1ZjF/Xn3UNlp0OXEVZgkxe6JprFU/TS0/7qkfEAivqV3Bay8xdAI7yRrez7H38MCODnhbkgvw5mMPCkrYVttn+WtgDJ3xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNev+MehDAdyGQt+QNTjLcTI4ap7dnWYdodAMxEKGvY=;
 b=PZnkQIDCO3WiUBlYa7SKY7UAREXcMpRJUH5caY312DXpgm8xAhDeqIx3Y2tGy+acxzGK4DEQ5HdFpDLqwIVOT+tBs0ECe6rrHGCWamR0UGE9cksF9es/JNAsTiNP1gB9hT4HBWq6SJz3DOvKVhnV5lrtY8GRzFhtI9m/rMSGFL49Sd4Od5+IS8XrikAyyDRDrbAA5a7BIK6Vt3eQYVT6g+zP2WwAvmXjew7Lx9dy2JlPkED36K20IKbgBpPpJJJvrclt+zUdAqWUsJdKu/2JN6eqQ2Y7fPz10+GhegilQKJXN1hcw+8wAkwEsO8GhKfmfeYWmSYA89pb0pH8S7m8OQ==
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
 bh=eNev+MehDAdyGQt+QNTjLcTI4ap7dnWYdodAMxEKGvY=;
 b=huYquYbwxpZYSDiqGXPFAqNNLL5MtcnvLlCSrMH5hqR7h4/jeVpybX7tC8J/3orCClf5vJYvLr1nEXZik+o1lJPgJt4uFtm9KSiR9HbAuSSkLzmbHBKa20uelrbIs8gYQq7ondGMQSD5ZLcpXBENUdmLK+8brxUNlbqKZf75wbtMsxbq8O3K2m5hE0o/gTEIxTUN2XQeLk2ojGMNYuZ0bIGWO+uGvscUpRpMMNI4eEZKFdX4u7nAniEm9MrYHjfQSNqpqCv8m1zCGE08Yz5aV5CM3bnuOljmg2nbCur4cPcQvRPN0f2x+3RW3i2aQ3/zIZ5JheUvy8rl5PjLQGXkVA==
Received: from DUZP191CA0065.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::6) by
 VI0PR04MB11602.eurprd04.prod.outlook.com (2603:10a6:800:2fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:38:03 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::9) by DUZP191CA0065.outlook.office365.com
 (2603:10a6:10:4fa::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 10:38:03 +0000
Received: from emails-2575400-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 592CE7FD4D;
	Mon, 11 May 2026 10:38:03 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon May 11 10:37:56 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sb3qWwZLrCQO6j/C11LWvoQmGBnkRke9d8KjaSbjGEheElf9G8m4WzbYDfrp4AyEbi86caLvY/rPRQnIZKP6Cns9BnJLepBUiegnbgQD9SOakZeqyciS92VKuIEJwc6J9SmaCE77JFobELF/rSKPNmATwodUmzXFdWboNQTyhUrP9DXcvT1ohi9sRU9R09OeEf2yFAmlhrfB4IyHlNLGQTCsKYZaPhWtYigWk8IN+JB8SXdzpubT8Hja88sDewQlPyOYm5tnDWvZ4dTOda0MbawnLiM60Khu2GOFBxeN5SfZq+z6EHnmiwl7ItxFdN/UfEG7LhxJPSn5yBX3WfClvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNev+MehDAdyGQt+QNTjLcTI4ap7dnWYdodAMxEKGvY=;
 b=q7ywr4CtWfqg9aE63+lQ/LUZTIQGxTi5WP7FxKs/y0zWyzSJF3LgLwMCOqnolCVMSWdujg5SK/u6AgLJM1AlsKyzg0eUHh1vKpWBRd6YOtJUYhxMiFcmkq0VjJGluIHMzPudriZp4clSOj1Ibr4mKbj0mhV73sGk1GPFeskobVZ//HwxJ2tCY8ekB2KqvG3SA5zbnQwq2zQXouF7HJdvPE6CXWA5VEAw8xw7FWRULgnRgr6JF5zgNTL+qbPQJkd2ZB7QjQ5Uh9WGgrbc0i44cAzIWvbiLnhbGCLh8Sn75/C8xY1m8JXsNPuFFB+H9y4aiURXCmyl2AgIyce8QIBMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNev+MehDAdyGQt+QNTjLcTI4ap7dnWYdodAMxEKGvY=;
 b=huYquYbwxpZYSDiqGXPFAqNNLL5MtcnvLlCSrMH5hqR7h4/jeVpybX7tC8J/3orCClf5vJYvLr1nEXZik+o1lJPgJt4uFtm9KSiR9HbAuSSkLzmbHBKa20uelrbIs8gYQq7ondGMQSD5ZLcpXBENUdmLK+8brxUNlbqKZf75wbtMsxbq8O3K2m5hE0o/gTEIxTUN2XQeLk2ojGMNYuZ0bIGWO+uGvscUpRpMMNI4eEZKFdX4u7nAniEm9MrYHjfQSNqpqCv8m1zCGE08Yz5aV5CM3bnuOljmg2nbCur4cPcQvRPN0f2x+3RW3i2aQ3/zIZ5JheUvy8rl5PjLQGXkVA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA1PR04MB10357.eurprd04.prod.outlook.com
 (2603:10a6:102:452::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:37:53 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:37:53 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v2 0/4] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Mon, 11 May 2026 12:37:46 +0200
Message-Id: <20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqxAWoC/13MQQ6CMBCF4auQWTumFFvQlfcwLCotMIlSM6NEJ
 b27lcSNy/8l71tAAlMQOBQLcJhJKE459KaAbnTTEJB8btBKW2WURn4PGoXxHB17war2xlhrG6c
 95NONQ0/PFTy1uUeSe+TX6s/ld/1R1T81l6iwMTtj67rfV507SryQR35M2y5eoU0pfQA8Fg/Vs
 AAAAA==
X-Change-ID: 20260502-rzg2-sr-boards-37d556668a2d
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
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|PA1PR04MB10357:EE_|DU2PEPF00028D00:EE_|VI0PR04MB11602:EE_
X-MS-Office365-Filtering-Correlation-Id: 3817c94b-841c-4c9e-a125-08deaf496161
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 D+Uxi6R7oSbFNboXvL5+/J9e8HqM3W08XLxmr/X550SCG/IhpIIZVWiIAKSMbG0Geh+IoMHK+UpKPSR8aQ7OFh8Pw1orh7cTNax7j5Hjm7Yf9neGzpFYPfpbNQUUfkjb0T6zQaEIwuNQRun6mJNc2n0dnuD9j72cjL0uHOn4uY3/ljisds6JFkCsYhtgpR/A1RbrVQ/JkMfhIlaigCnI32ntaV+PnR1AiFqtQxEy/hSSaP3YCaZ+migREDsMxQx6NHm8U3e+a3Vx3g+yhi5/k/DVKB5V0ipRRfDYnQXSMXUM1CnSh+G6l5GY1X6+fuU4vkLW3wYhNBHN7P24xvKRpKV85dWm/atWbcUjrtwQumj+AP9ooncNKwMfM4H38cn7pewzj/tkrp59IlZ8s8Ty27Ot2KAYnPtCW3pMT8yXOaQ0khy5LPlilXZtWSjZZiMKexSf90ie55VAuB/MMVQIVFNLTWYqiLkYEGPH+x9pGoG18GuI7EY71xJ46a8joh9GGPBVOAPor4KIxbVZuxN5UWOczVnLZwCQxEXjnJAqf/Ncajnp6HKNrNDN7eL6SSlRTCoQvfmfl5ZW+spoCjleuANroI400LoruMxEdpU2VZTT/IVQrNpwrk1NMSchScOyER/3kMNgMVkBUF6F4cVyCrq41KgahcWFjrEPyI40UmkXgC+OmqBtw9r72Dzeint7+5OLJzrpfy9xGxBPbl8uxTFGs9uVrqNEimhtwBHk3jg9MxNikQWSm61q9lblBgk1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 qDCdLtlrQQQvrhiChqe7eSm6WzS9tjp4bYC+sZ93pT3uuPZzrMhw/W/BogtWyo7xvLJVXbbcRvlu++NkuOpKGCFJpCoWErnt03SwLalXuhMeaCtvzilq9J393VoqGTJlwii2UWs6E3S0I/qBuJHruuRBol0oYihiwk02BaiulJZdiCN20P3PRbYeu8jyXfROaNoLbJ18nKSYjec10i31rdoAFMYxIAOEw2YSKCIG/we4oik7a7oqNdeP/Vx3JGj0YmMQrTM8LA3oY5XKZ6FAkZUZ5WZj5fZgob47hPQppyG7ayFeOev/KPN0Ac1jRlzSNiRDhZcgtttj0D9JbiILaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10357
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9b8e02d0f9bd40018c59224aae14b9f4:solidrun,office365_emails,sent,inline:5e585910611d2837dda89d7e66cbf95e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9813f19e-ea53-415f-0a17-08deaf495b1c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|82310400026|376014|14060799003|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8qTGdxhpsfhkScVY+YryplwXPeHi5IB00i5th6d4ZrCvaPL3ve2a46psFOmxMnUgKKciFjYH3NdWhWTKTgcGt5VgMZTYWlTTW+5C+NeGRgeLjkVvZ9xO4sMwUU0mBaIRxlWQZ7Q2gfkU4SYqcR2qmPM91q4EiaOVhQm4ngF+ajaB3AM48LII1I6KtHE4CrpqQEuEbXUTBk+J6sMy5s0ELjqlst8GB2Sv180VeevERYbevV/fzVsvthmKCioywzw2iSBbink3UqbXuK1+XPLLJFlcF1FsiDJI8DhoBCvQ9xA/aBxsyyT3QyCkjTqSa/N/7MJg6zTUbwvwZKk/hDLYjPne5xKbWX+IYdOjse9wznVeAv02d9z4IduUqi8VjeksnTQ8BgxqmbNVHb/kGlfwpWAqdyMZfsm5rTNAQuSvaf84FL0MLbhBzSEycnF1TZcH2aWtpD9ZENFNpl2xCdeKTUaITgSbYpKLHW4V5NdVaDTMv0TMP/ePAhQonA/C6A7uR5sgVPTIok48p+/OO30mwlLyBuz16C5mHMTCGXWLChkrnutTL3Yyck6FF19oSkvVRlCm5zit09VzAlKHOXHPNSF299hKFx+x3cuOXJSfUL25Y7aT2Rh/nUFHFU4TvHr9ke4cY9/co71H94pYzIUYpWzxi6dbuEOBP0XnlifCcIz47TrM3hUKn7cOJcCVzJP7SyxAsxmEaX1g3qOHH3Aba4zBU2Q8P/2qKhMRm6Ew6K8=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(82310400026)(376014)(14060799003)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	li+9fCiehwmHglbnDBeVokWR91LVszhQAci1IOjXpUp8wiqHlfAPOWk82VA7n0PLln9DgzihkB5hmpn9RRBfYIn9TdgVEz+bOi6ryapXcqnT0Mu7sbAbsxiT/lb/ZacYq2OSKXsHSrELHLV6U9FjpBcbHj3vScRIzosU/U7DMsYqqxvoWZfPk4BZpPU+fOMMx3WbB6lvOO8l+w/1IPsHxh3N0GCPazKI+x+725y9rXq83PdeNGMui7guIwO6HjS8BGOOWUsBURsojDMEGQKjDeL+okYgRfQzmgmYkJ7ALvqN+7wnOgQEy1FtH+jV3l8OJwiwVXmGmq6gj8naF8a8pEgLLEE7IT69gvmkfUwT3SGIsF27n+EsrAzy6lLr/RzM5YHTfTOox2HX4fN5vePYxq5w++OyZZDaAybm6xrSjNio3mUgAytBDwgw5hvK35XV
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:38:03.4005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3817c94b-841c-4c9e-a125-08deaf496161
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11602
X-Rspamd-Queue-Id: 29A0F50BFDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32370-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for a variety of SolidRun RZ/G2 based SoMs and the
HummingBoard IIoT Evaluation board.

Bindings are added for all SolidRun RZ/G2 SoMs:

- RZ/G2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
- RZ/V2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
- RZ/G2LC SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
- RZ/G2UL SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/

And each supported carrier board:

- HUMMINGBOARD RZ/G2L IIOT
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
- HUMMINGBOARD RZ/G2L PRO
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
- HUMMINGBOARD RZ/G2LC BASE (Ripple)
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Device-tree are only added for the first board to reduce initial effort.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v2:
- Added relevant product page links to each commit description.
- Added product page links to cover letter, thanks Geert.
- Link to v1: https://lore.kernel.org/r/20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com

---
Josua Mayer (4):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb

 .../devicetree/bindings/soc/renesas/renesas.yaml   |  37 ++
 arch/arm64/boot/dts/renesas/Makefile               |  33 ++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 580 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  21 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  21 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 420 +++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 373 +++++++++++++
 13 files changed, 1656 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


