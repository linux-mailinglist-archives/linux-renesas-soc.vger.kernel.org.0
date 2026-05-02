Return-Path: <linux-renesas-soc+bounces-31872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1bLtEUUh9mmPSgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 18:07:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FD4B2C1D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 02 May 2026 18:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79571300D17B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 May 2026 16:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF657366DB6;
	Sat,  2 May 2026 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Lk7IouRp";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Lk7IouRp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023134.outbound.protection.outlook.com [52.101.83.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E960733F591;
	Sat,  2 May 2026 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.134
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777738050; cv=fail; b=rKdPKc30mOaXE1b3CVwd/bsYWmaGBve3QWLAOswYCY22PseBZ5IrhTdtGvxFTnHuK39DqVfGcjk1v5HbKrMvhOvvvTrgvSoc9C2qJb+oCoeg3dTN/EbL3hrLlN5FHXD5jqki7BiEjJB/ZaY3S++Tsn26KiHVKu48w92LEECnNhM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777738050; c=relaxed/simple;
	bh=eR1FCr7sTlMxrm5fpxQ0XxtDoDNZHtlisOzlRzNr1pw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J+bDlzBChE85U7ETRD6W5GaIN8d9Y+JqF9QZkyBbyGhK8b6ZaQqz8MwS+oNCQ6AULJXDKh0UyuFCel+lxEdVjUoG+ThvH5DLzUvMnkA8hEeCeb2Vyy+psdeV5OO4UNQrPqPo2N0rOB1s2IbibaGxevWWgJTwoguwd0XKkHkv5D4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Lk7IouRp; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Lk7IouRp; arc=fail smtp.client-ip=52.101.83.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oeo+oq/oginULNul/2a0gsAT5gZLFDzVcZ0vZztKczxL6DhSpJdv2HFuLTmso3uISDbPYbQ8jbvkDvUbE4wbQ4dcuEfqWzXPolC2DcZA8lTuBYlev5jSRkPOkGl0TTOAn62P1tamsmqJDz4GEfI7aLChDDmKkdpkMiMk6y8CKAO/i24ATA2iF6fA48UIYtfPgBo/ZIpD6IiF0MUmMcuZENtZaGluzyXNroYsIH6RdoJvSjhwn/4YtNQiPUeTVXo8JxjR54Z+yBFD8YcxjrDgoyq+zOzI9R3Hwk6wlhNtGNrQH1XzPsrX9tA13AmKiqiZTRUo8WK2xNtJz1lIzpKA3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/VDZp8EimZUrGgZoF09QyyljplVXQ3V9EAe6kWfPXA=;
 b=ftqQjVhKHcTAkq1lMgvRzfWXE1Fdnw1a+sdI9w5CrJgLaz+rrL5+YWtmxlKmF6vqYykEjqrQly9447XV2x9ikMusJllR8AkC5yuxLtwPOIvZjvxQFyzW6RwTBAcg1Zl8bJx6QWfaGBoVxBUx71BYG9q5UB2w0WQf9rOJ+LGn0vzdARIHL66iuRFsPajYZnkwwW2a2ydFZVB3bnQWzvZdtsX57gaZ5qMJ54MUns2tsMQ9wszmePZmBewZJnoK4XadcdpiCyD/qRRD/k2B2r+K+W3lapbUIWnjfoGwGkZIxFBE0JzSErnCkoea0PRJ9K30QFRDT/gR7mIdBXf4yTTmNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/VDZp8EimZUrGgZoF09QyyljplVXQ3V9EAe6kWfPXA=;
 b=Lk7IouRpf7luPg6qri5gWbqPA38AI8fWkd4wUCfmVuwD4QorqjoP7vA6m/4UJ6OmVc/MFDG6NWyTwv/mG7U+03d77bVHzYbBxnp9JPM/zZ1JxkFbFyaOcUDNcG2iUMdmWcFW7rw8rSsKi9ouvXsNgQEbd3uyG6Ra73Zc0SrIxJRWuga6XAdBuLiYkdf77kt00ZrFYARE4IX7LXgn1pDyjM0Mh7OfKp3ENihTkmDwUQVP6lmLj6X04sOeH2w1Ws9yRTuCkc0cA5du98I+Wid2s0/zviMtk8GSXQWGHOtdOuSVpONakwnnnnxb/EINRB3ApK/MQP1G/G9oHpzSaMcUNQ==
Received: from CWLP265CA0496.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::17)
 by PA4PR04MB9686.eurprd04.prod.outlook.com (2603:10a6:102:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 16:07:24 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::ac) by CWLP265CA0496.outlook.office365.com
 (2603:10a6:400:18b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Sat,
 2 May 2026 16:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Sat, 2 May 2026 16:07:24 +0000
Received: from emails-9438766-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-243.eu-west-1.compute.internal [10.20.5.243])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C340E80513;
	Sat,  2 May 2026 16:07:23 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat May  2 16:07:18 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QA5DDfbkKe/4uP8b3UBjUVDMzzvGDiUuTGWo3nfNwDoyA88kJg7R3QEtA3aHc+w/qzW6Jln2Tkh7KM5jKA3c7ToyPqL158q++2KvMCo2BKz3vj0mCiC9SD/1f4IPzRQvp5Fiytv/rJOdKPSaZ6h/f5czrz/2noEKE2vB7d5UmXD7D1oKrBJJ7UWG27Lv97KvD9GqJcxk/G4fiwziCI4k1mhg1Y2dAnwjYA88FsvMCh0d5rGieUFo/pMmDGNo2WpE7iaTZ83TfGxWeWeqbbgaCp9yNjiKIsqEumSVZ9Pb3HuIicp93IMtr0M3OOhnbiUFSm6VzBgatnSrReLwQpaa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/VDZp8EimZUrGgZoF09QyyljplVXQ3V9EAe6kWfPXA=;
 b=AdY24pg89UrUmTPc/jzn0+kzCfc3pRCmVoN5FqwySGOXKIgM9ZbJXbQ823B6zWVeg+mu3nFhwHJyVV/jEU6JgzuwLvCpcRJbi2TAxVFjjV+KbIpFgDr7AVe4zDt6HZkhtdG2dL+I5HeKdqh4liRnBpr7rvNq7Il4Q48E88TdjbVjWAKscuH+5CHmth29Kx4JHlF1lLDWhnWQ42ctSyvcuPRgHR+P3EWesVpH9UYV6E8YEl30aS7M/ZhTbTTrJxb6LoR/r/OOEo+1C24KTPqJzpqJ6UG5gKHJ0vvd4FNjn8PXlf63bGIS83cP2P8nFRmaXE2IItDNK/z0S0aO36+ByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/VDZp8EimZUrGgZoF09QyyljplVXQ3V9EAe6kWfPXA=;
 b=Lk7IouRpf7luPg6qri5gWbqPA38AI8fWkd4wUCfmVuwD4QorqjoP7vA6m/4UJ6OmVc/MFDG6NWyTwv/mG7U+03d77bVHzYbBxnp9JPM/zZ1JxkFbFyaOcUDNcG2iUMdmWcFW7rw8rSsKi9ouvXsNgQEbd3uyG6Ra73Zc0SrIxJRWuga6XAdBuLiYkdf77kt00ZrFYARE4IX7LXgn1pDyjM0Mh7OfKp3ENihTkmDwUQVP6lmLj6X04sOeH2w1Ws9yRTuCkc0cA5du98I+Wid2s0/zviMtk8GSXQWGHOtdOuSVpONakwnnnnxb/EINRB3ApK/MQP1G/G9oHpzSaMcUNQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB10552.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.24; Sat, 2 May
 2026 16:07:13 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 16:07:13 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 02 May 2026 18:07:04 +0200
Subject: [PATCH RFC 1/2] regulator: dt-bindings: raa215300: add clock
 output
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
In-Reply-To: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DU4PR04MB10552:EE_|AMS1EPF00000048:EE_|PA4PR04MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: 88221a54-b141-4160-8246-08dea864e5f2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 asIFFDmbDDW4bWwmVneZXloSZPJuuCBEQjqbAli54Lmec3d8kpuFN/7lrhWgT62nNAFeckILLRx9wBrnMCRDv8KIevoZcCOlpMBzlPpVMv0Ui6iHd2imrhy+gvqmJjN2kZjf0vX5sWtr/BhtKGGoZ9a30JDMkwhgA1FNQr6PRamFTFy/+t7UfXOBgP7AAnlvMMRPaHhpcdxhsGbx4c44PhoOcQ/OYlZwJV/Fw7jTzULTkTFHjHNnj161NRD3W5dJt/ZcStvVRXY2b0Xu9sUyHUG4N1X+4ART7l9NRzVH0OnEna6vDsqO2+nf5/SwzJXdTJeRWdfTtuX29xUhGB8OlsD+t/HWpFz1Crwms72uNtCiASlLU9ERCP+Wc47YNF5JpDigop9Fj9rN7kKWSs8mU5N4X4tl5dNbb/dpNncOXTwMq2NEjpWZwPMREyHmn10oZbEV6vtJW1vYIsWlA/5LvsN73a8qbyWC7HXygQaiNAFMGsu3FtA1KCg4kzrSF3JPl/TgwatD8LqDfa5Tlsx2zo2NIjR6vAhoxKqWHNysKDAvyMmNH/5zhPLAXPLudEYtbCtv38bqFZMA4PpuswNC97DCWdMKFvqZ9qqEeBSt0Bm/zIW++rfiOaFRs4Uv7rBZxdEXHX+Bm720dyx1JfTjmp2zY/UUfc3QQX7wxgExyFjfurfr1knmox3c0xPI9JzO7BId3SGkTcOdhvoW2XYJ3Wb31adzeLKCjnilPvGf9gPymN23iZ307gV6BlpZxG6l
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 UsE8A9z/kmX29DtA1xjnloFWWZh4G5Cy6s5Jt9Ne+QgTApnANcmge0wVraXX10KZgBB89RIjzkPIn+OH0tA4quxR+rgHxlqHR2f+PJ4FN95n/BSZO4dWIMB/1rWhwCU+Tup65jB04gAAjtOIW05Qw4rBQG8uCQrvmO785AevCxS5YC4psIp88m9/j/Yn4hE71lnAT4QndVF5Mh9RyJujSdgF2jiMkgnJgJRK5M0FLZKanuZ+4GvWNEwwUIriWxY2bGt6cPoDEcRexx1vSfDPwsU4E8XrO/1PsAjI0j3p0dK25l9SBBGgegdUNWi598/K4nAy3d59usrrlAxfO2cimw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10552
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5efaf2c067f44bc0abce8afe4dac6b4a:solidrun,office365_emails,sent,inline:f38cd5633cd2c55ae12c4326183bbac4
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8eea875e-3515-44fe-bf77-08dea864df43
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|35042699022|7416014|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6yvZSHsqTs0E8+aiUFdfmwDxVwSKJ1jVGTVc7mZjoLBN7jWLndArc4MZy4jVeCrF1RMINCh0M6O3PvoFGeK6ZGBRVUL3Ll2zQ3KM3oQDvqyhGXfCk+U3UTfrL5GFMfWdJYH9Y96rhlp3NyAjvl/fW5a2k7tiSDdkfp7dTY0NLMZ4dFU8ZYv+u+TkO8VC8MRL60mhDVkdJ5oTWG8ngDtG6JzqnY4DZS5rbCn5x9aTYluvfAB9sWQsZIjf5mUfwbKOhR2kbUhmBPaEZxVD73x2N+c7D+IV+wVbEBKJOvrRvyKbOT3h0tJxuimdiA3eqmR7qDbPV8qRwOqbmgcjcev9W1LUXNbuIy3exrUjSinL8gPCQnvssUO0sOER9D4nMhlCT7ObubF41vAZS4zWLGxeqBApzB0Hmyp0VmyDs8m4dLwgrSG459nTcQ0muxruRhEndZPk87ilf10MwT8fKteK3Oghx3LRLlUt3HICe/RzHUi2NQs0zNNLX5b+G59SSslqdpgVFHjDzb4zR3BcbKExees+Ul9nYD0sEytzsQaNK+vTO7yn3DC/k5woCGKxosMrRZzRhPYKnThJrELwzJIItUNTg1kYlbJV/uLlcTU9d1psB9yLJHzfP8PWGK6ICyqS18mHaFc0HnW8jKk8w2qChqbFss3+pwFqlI/NfLelGcYQI4T9vEtvNCkKZpYZYlArg9MCYiMH6mos5ixMdgQHXjAgaVvhrqlwSXUY86GhSVg=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(35042699022)(7416014)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8aQq83fmj6+fOR3jMi2RD9CfQKG2KrR0dHSWf+elGgpA3OOS1F7MLICLzvscuSyjbErs6y1ASUgYYECNQj/NAQ9XqZ0jplV6fbupDn8WGQ3H/SZ8gc0ounpqbwNDZZuesuONAApIrrfqgtPf0UqZqGHvuxPr5jpVQjXhwhHOt48CcYS7TK4i9ftVjs7Kwi4SKKpGmlFHF69PES+BYriz7c/ZQR8S1P7GBl3eVvIY2nj4HE8pSr+ReKNBc4kiwykSiU0y9aaEzUbu9SFhFu2jJNwdJu11cJlC9owUNsc7Pmtxk/tgfEv5xDDBjHFMf4VhTt9Kwmu/n0t6fyg950CJsr7C+TNfYtSkz3UzcWrXjm8BR5V1BUJzXwuNbfF9H1JxhY53Ed4npNUMFisGB2HprU5YS8AzixZbX6tjJPemRPj5QAAjSxJ1cowntDnmFMv/
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2026 16:07:24.0321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88221a54-b141-4160-8246-08dea864e5f2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9686
X-Rspamd-Queue-Id: AB6FD4B2C1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31872-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Renesas RAA215300 can generate a 32kHz clock on MPIO2 pin.

MPIO2 is a multi-function pin, with clkout being one of the functions
and exclusively available on this pin.

It supports prepare, unprepare and set rate (32k divide by powers of 2).

Add clock-cells and clock-output-names properties so that other dt nodes
can consume this clock.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml b/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
index 97cff71d29677..b6b6b76b16d30 100644
--- a/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
+++ b/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
@@ -40,6 +40,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
   clocks:
     description: |
       The clocks are optional. The RTC is disabled, if no clocks are

-- 
2.51.0


