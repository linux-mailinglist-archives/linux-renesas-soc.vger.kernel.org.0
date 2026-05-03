Return-Path: <linux-renesas-soc+bounces-31893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAWhKwcv92kwdQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:18:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE264B536C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67CF83001A7E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 11:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2BE2D9ECD;
	Sun,  3 May 2026 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="pNoLEWDo";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="pNoLEWDo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023136.outbound.protection.outlook.com [40.107.162.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B75E182D0;
	Sun,  3 May 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.136
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777807104; cv=fail; b=R/mBEdbPJ11PCEpJ8XZV9DcDz99E7k3reTfWyYyk0VWD1jPcIJpeFJLTNVPKA0NCXisH14UDOSjKvXXUtlQTYHwWQI8YXSGAg3BuAtAKmRSlisGHW5NQ5bs82NM7aDZ30ENYUNYpNs3qkVKonoERKu8qInN6AFSQhGIhV8mgv9Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777807104; c=relaxed/simple;
	bh=4aEaTwAQWljbimWozGzw8Y52hjpT2stn/Lc1h6vFz6M=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FzcXyHtiNmIoh8bFUeLPqewi7WXPiAFTM8HPeFxFM9HzATEUzG6sPFZoBlWsMPb5BF1OzewMdeGXpqhuqvEyAQDewMknWVdNs8eqeFKlexStj6l1tzrPQR1RweIy2sV0p0BLA7yYp1ZEy11RVP4oX30STgMM9/r4mIJ40n/b9BA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=pNoLEWDo; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=pNoLEWDo; arc=fail smtp.client-ip=40.107.162.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CSxiBvOsUJmYaMA+eae1IKGK3pedZPO0eskATWgdJEDD94o0q/gK//CCRqfjRX5dxyzxmt3Fk6IUL8i9UKhYNExdSvg10yG19H5Tzho2s3osrONC7e57QivnfYBIRlfwszOXDKjcnhaH0UtfNyz4L+qxhixexJf2cGNQF+i82EsfhjyPu5qYqmuX19Fvviveqn6mf7D9bIhx1FJbUH2oBdSiTweCEsnJJCYvuEjV6ZWdQ7o3ZgZVrr3kbht8z5fLc5rwSPk6RfVNw0jD1xksjo2HPHlFWh4+RoZoEbDODaA8z5zQfyAst6JLcG7eKQNVKUhRXRxySreUARQNZM5juA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q6adj8BJt0CUKksrV2+49KEkAQs37Tym3f70h/OEr8=;
 b=vjxiFU9+6TwVawj23QioVaSyeAldfzbmACO6I2ywhVJHD9GJZJ7520SJcMHIqgc4+QizwIWYbhsnfVW04MJ/1jICsHTW8LVP96Te6DqPeN8CW6rNhpuI6URerE9/X4h0XeWxDgG4oatUAlceyRi/RbvUD1CbY6idET08CwztsyiZ+Vjg0MNN2qO6H/oX6Mz88y7oKqOe2zxjVDRRQH8dvPfejLu3lvnGKwuwI0+as8YuQ68CgX2GZa8a0ZTdq8GPEfQN+BssUg/vJWUfwl/hiBHSSIJ4O7Qzz94Nd+kDZ8omA3xrUYtQuqMgXr3+vx+lpQGOCyxTv4+qFdCgGBHw8w==
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
 bh=2Q6adj8BJt0CUKksrV2+49KEkAQs37Tym3f70h/OEr8=;
 b=pNoLEWDoMhxKxaIbu/ZU2bu93RY6dm5fLsFs3rpCsaI21WhELSgrwPo7Qeuut8cgN/lKZhdOUrvjTjVaWjFon51D77nyZYX1ggCA6nY/W/eqtgxevrubpGga3uKleMj5/e0ldFmMgE0xYSNLTuQyNvAs1+scfpAHMcWx2V/MeaFI1/BPaNO23sL3hSnlbi3srD3v6NwELFbuVPBEwveMfRdp2L9bQa6XQp+C85A3XE9UZcYmgqZ4YuckjuFQpWKBQnTx21OQ8yJIk07Hc69i6qxOv67RmfqrOKKRJ924O14dHqVPWOylbh8XGFOrduyQn3dNg9zCE956rJFTAtuo3Q==
Received: from CW1P302CA0022.GBRP302.PROD.OUTLOOK.COM (2603:10a6:400:297::17)
 by DU6PR04MB11085.eurprd04.prod.outlook.com (2603:10a6:10:5c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sun, 3 May
 2026 11:18:18 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:400:297:cafe::5c) by CW1P302CA0022.outlook.office365.com
 (2603:10a6:400:297::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Sun,
 3 May 2026 11:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Sun, 3 May 2026 11:18:18 +0000
Received: from emails-1159285-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-243.eu-west-1.compute.internal [10.20.5.243])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 03BF87FD1C;
	Sun,  3 May 2026 11:18:18 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May  3 11:18:11 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAss3WLguk69TwURmpCuo1zMU2zdJwUiy6ZBAgREWKgIc5s9YrkfzDHEVrAX0mHLTwUOXE7EIzHLG4Bqj5LQkZtUzRW6mxMoBaAuVAZyudXp2oh5dmFNUuA+RPrwMdr9wB5+UQUdVlchvQZXVqQoOWHUw4w30jDv2ZR0lIKgLwQnMM3jObtiSRsV9MTVgf5wmMibUDo4F2fIAhX6oVbnVVnsgFXqYXDrcOm8V9T8V9jrMsLbOTgDvDDQKkVEP28yWCDtbHdLduNdiCYt7kat7Tdi+UHisXDFQG3PjaZ54dsm2NRKI7fGH4YuI6CQTQzo4vde/BvHiGd7fj0t4u/MZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q6adj8BJt0CUKksrV2+49KEkAQs37Tym3f70h/OEr8=;
 b=vbWG4HE7zFW6MHPexlS9Cx0GGrTvrux5RfSvbuKZSh8qqr1lOwqWhmieqVWY5acMHVaiGupHdzgvYfyCiKtpUEYLoIF6rgQ3RQ89vmFz9ekyjT3zGwLEWEi+btndIoZGaf8b9knacWaqA8i6Sg6PFyex3uZPeICYdZ7D+a3hiom9kif0GuGUFf6WH3TNqzEYcnnRdnuX/8zw76Xcwkgb4KcDTSAOdkIghtArXA10gMGNNRNvvBImssPwXRi0nHBPL83vibu1/bN4PUUMHmv3muy5ePXZl0wxEUS8ajqt67G+CIZHxC1v2nWgGHXwchSHCRu7HqR+QVTjY/zJC/fTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q6adj8BJt0CUKksrV2+49KEkAQs37Tym3f70h/OEr8=;
 b=pNoLEWDoMhxKxaIbu/ZU2bu93RY6dm5fLsFs3rpCsaI21WhELSgrwPo7Qeuut8cgN/lKZhdOUrvjTjVaWjFon51D77nyZYX1ggCA6nY/W/eqtgxevrubpGga3uKleMj5/e0ldFmMgE0xYSNLTuQyNvAs1+scfpAHMcWx2V/MeaFI1/BPaNO23sL3hSnlbi3srD3v6NwELFbuVPBEwveMfRdp2L9bQa6XQp+C85A3XE9UZcYmgqZ4YuckjuFQpWKBQnTx21OQ8yJIk07Hc69i6qxOv67RmfqrOKKRJ924O14dHqVPWOylbh8XGFOrduyQn3dNg9zCE956rJFTAtuo3Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AS8PR04MB8022.eurprd04.prod.outlook.com
 (2603:10a6:20b:28a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 11:18:09 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 11:18:09 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH 0/4] arm64: dts: renesas: Add various SolidRun RZ/G2 based
 boards
Date: Sun, 03 May 2026 13:17:57 +0200
Message-Id: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUu92kC/x3MMQqAMAxA0atIZgM10ipeRRyqjZpFJQERxbtbH
 N/w/wPGKmzQFQ8on2KybxlVWcC0xm1hlJQN5Cg47wj1XghNcdyjJsO6Sd6HENpICXJ0KM9y/cN
 +eN8PQymajGAAAAA=
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
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|AS8PR04MB8022:EE_|AMS1EPF00000041:EE_|DU6PR04MB11085:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a22a27-9ecd-4fdd-8b4b-08dea905ad75
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 CuLRH/dlPUVm5oI19msyVhClfJjJvC+rkdKZNa+o83u49wDTfZghiVIWRhPHdnVz98yhkoZ3BgaixLFPbxNPbqyguSN1orIGX+sexjwgG9HfsjqxPWO/Qhl48jVt6/GhWOx3+AwnFb/XQmdoOwm9StnXagbB/jaRoUHKV0Coxt9ksWY3quCkctppZSnKI0aFknZthOB/1+t0U9G6p9+tuuYAYem3+Q55xHE0SM8z7/fldyAZuOupOF27y0nGrTb1/b/gg/+3cAOrmj0BiG9hCe/P7XKYiiEms8AX2FFV1NnQ9IF3bohU7B9yyltiAEK4DTKbL187rr6B9ofAZxgKsJ0L9R5yEE3siWBUSOG6qNTnXuW+Zz+Hmi6zQhxtEUxRRqdtA7ZKXDSAXtAnuor9lOwT80PSqeaVRDqEO0YuccS71Eo7hczmokCnpDB5K5sG4IVPKBVdyQWOgxr5agJtcaqsziO+SyvNIZz4wfmMqNA34PAc71iAw+xIrizE0g/GMPpoCs4nmH0PZ+hv7eLjsIu9yyEb39CsnP+Tkuf5Hp2pDBYwh7ao+v+njQ8hVwb/jCg+vzFzPjZUqfJOxLBHAExTt7qYatsd/Ept1ZEfCOpAk4DsIZb9JzVcX6S1kMoTN4XQZBQQnXdWU8whuxbh7gonRQxbUwQBGE9Vk9B9USsHxu0gcxDdXACaVkNuNu0+xCOzEM1dzPOOMLXjpUmw8eO5DNxUM/rGksgj5rkcLuYRZOlKfUAgaXPdYU+ceyN6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 wqiE0YR8cmgTDpda6xeMOut+u28ola51NTroOK+SHWEx1A9uaRePxy8fwxKc4s+FnHbkTPEgwo9f3dYPlTTyuyUv6m2ojm8EOpZ6ZE5sVHMtqjov3rrmwh0CFN6c3KE5E+B5VfOg4OcRMphO/ycxCtFjwEVQyv8jx7izgLo6Yb5zgWVQPjeKQnwAJc8FfRQ/6TuNTVv2yPna8uWdQQV+lhjKo19iB0jQcnNugBJaH7VXL/H0LNldSf13zxgOpMnjxDGI5uL+HZqptYhLWURBGm16eM+k+N6DYChDkIFlaxjasFXwed+4Ap5auXu8UpFhu6FfLb4I0H5iOMyoYCR01g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8022
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: dc173b31e72c401a9871b53701f256c9:solidrun,office365_emails,sent,inline:4d3f30dacdf940b3d93398ab685c33cc
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	90ebb892-9103-491a-5c9d-08dea905a7e2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|376014|82310400026|1800799024|14060799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	T1X+2qASTT+6lqYncE0ZV88ZgWm5bMYQ9kvNOkcmxc4r+2VJAAk3WyAU7XCstnJtbTLbqYwBtwkb/Jg6heSbLI5/8XcK+NEsYDE1tbVPa8Chid9+D2QsoTfxwo5WFkyLi0TnTNZVkCP+Rwl4anVAVhBsfXH+u4pD8HxphwImA2/aJBE3BezaNJjZoyhJDzKK3Plh8tF+oCJVvUbkNfkBe0dMK7gBDWlheguVbW3eXhs+fPhbRxD+BqJoA4NIULdiHU3/uZfx6rIaK3FQypfjcagtJPfiC0N6hwNgRzoTbGrEISXDpgrvJpopmI9fbP5hffghrl79hJpFwBtRs3tH40lKCxSTDkCmYtgLSpwNo5H+xtoAJzF0poosQ3VGwJ93xfiOSMALoBz+J3BFdkWAuYAGzIpkAisvdvj9zvd1bN+K0a306eczfLWYl+qWBBtmiEsnJ8JzjlEQg1C6vC2KL/Jun0f27+Vi4AoDZbU8vVSNjseFTb5OPYgM4GxoVy6wg7G9ZDEiQyBYqydTeS6SeEirwaJ4ETIWCzxU3AXAzgSFBHOHHK5RjE6f3lzFqxSNxSTnjEt0nTT5FTBbKTeHbQ53o+HJqqovymJ+CkB+XZ0CrX05XT9L4xEQhDBmWZihtkJKtnQcpct5f7hhEiBVwIigPRqKzjlndMlpocNRld5pGoDTTmtoE/VTeMqC4a1upLHXro2jhNFho9LPnVOQfQUbyGih15OIq/TntXIN0nY=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(376014)(82310400026)(1800799024)(14060799003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qzPv7VQQzEJAZcYpsfz8+DkpZmBTkQeqWpy+xweV+JHQ1NyuYC2jyUztc7FVF4fksdVyQt6uZrmOt9s/cywjGe3q/Sc2pATQUPksXvmRspmtqfW97H9oNgo8cDC1qhJfmCj7//dqF1qNqTqUsNpBOxAIgXNZOEjfAPxMuV1tvzXX7kh8DivAE3A9mV75X+1euZPGtE5bcnmPOW+baMd62EnfBF+FOTbudCSRAn1swfCrz4j0AzPJer1J9jO3Kee8b7pPb68W1zS3PsEzxEd3oO0Pp+SeLK19zNOQAN73qbhydRWtnK8lvbbEcRM4arQrp+ULFnYW6Rh4sCWxktLESxsrJUIR1hIHbb4fSSbclF5tOK91j9iJ8DQILrDCeeCR8PwfuCkI4uNPwc8ffwOCdPynfdNmgOvUuaaDJnxscVAId1s7IcTIqDZCH2li/DKW
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 11:18:18.2355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a22a27-9ecd-4fdd-8b4b-08dea905ad75
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11085
X-Rspamd-Queue-Id: BAE264B536C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-31893-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Add support for a variety of oliRun RZ/G2 based SoMs and the
HummingBoard IIoT Evaluation board.

Bindings are added for all currently known supported boards, namely:
- HummingBoard IIoT
- HummingBoard Pro
- HummingBoard Ripple

Device-tree are only added for the first board to reduce effort.

Signed-off-by: Josua Mayer <josua@solid-run.com>
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


