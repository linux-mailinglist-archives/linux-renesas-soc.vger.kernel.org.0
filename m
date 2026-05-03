Return-Path: <linux-renesas-soc+bounces-31900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOcdL3Ng92kWgwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 16:49:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE54B61EC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 16:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C37963005D00
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 14:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652172765C4;
	Sun,  3 May 2026 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="SIABEeLc";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="SIABEeLc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023105.outbound.protection.outlook.com [40.107.162.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A044F14EC73;
	Sun,  3 May 2026 14:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.105
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777819759; cv=fail; b=HPnKYxQbghRSTHzVLTNr37QkA34f+qlF6TXXiuS+wG0AuTKmDJZPZ3toKzTjUfM5DYYRZQP295tfY/4GNlrWUa0CZPWf0iTmoJqOXC5Adf6vJaBCXpln0ItC3jeEJj/+lKT33pymGSBF4zYE0e4IoG8QIi38hTM7AnbJ3ShoDO8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777819759; c=relaxed/simple;
	bh=OYlz3x5P9m/E3zjlW6xPHgslo5Hk9+i4kpgRdS61tOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GjyeCcItsblZVpZfu6I/zFjDN5DQdcfbWoqfOpuw7JUG0ByG21U8+gxjTMoLmv0CfFR7I6EpEbfcMNJXVEQ6Jiv00ISSGLpksKBUsgTqUYGtULCPHOPAqP/veC/nPViIEkTZfksXfyidWT2lyYTq95c7XiTYh+ZdEfYEXQjlCkU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=SIABEeLc; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=SIABEeLc; arc=fail smtp.client-ip=40.107.162.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j8Va605fSvg5QHJEq70tnCJHtNicINLUOo63FiFljDvIRTsPtR3eLrLNTpCKA3C4wK0SB6SKCq267QcjIEM6fTiS3aQ17XHhtc9+raGfb83NpKu11CdydmSsHJhjucoWU5sNud6wsyiZGt7xO0JOhplj3Ht1zCD/qd/uKA4YwOcwlz4ElE/UR0lIUsXArdU5FM3ako/OfNcnC0565hstUBBa+TTvMVpp29cYCpuinK3R8kFWhxjDXzQLlmLGKeLAgE68TtpEKSg6+pXSYLt2qdNNEPfG0VjbYRlIWq195v2wPA8sAaYOllFXjb2IWb1Rvzk6M/wDwG13xuxjsCNpOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYlz3x5P9m/E3zjlW6xPHgslo5Hk9+i4kpgRdS61tOc=;
 b=p/Jz1Y8ft7OiiCkcjSPED0UHDUesS/7yD4ERWdRhgm0wUaCQ0Uj1VOkB4wSok/xrOEbBL51vXcPqBblfrekZamzOeOGyH35plxCUpF3aI0HOgS9C32d9iJ83JA0/saK0YxnfiAMLZPD4GyB7RqVBfZe9Yefj5sWXXJHexfTP6TJ44c5ng4bHhTNwY5kXM848xlncT5aDYZVTrD9BXsE+R+bxk213BCf/t87BHb7i0TT24Gl0Rd0ekZCwV0gAXAP7qd3WAsLg8qf4WbeKAGcZCQZcT/ba3jQFSQfznsUh64kIuS65DY+M6g/YrvxmTInA9ZmNeLuG/IiXxKAunmOkUg==
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
 bh=OYlz3x5P9m/E3zjlW6xPHgslo5Hk9+i4kpgRdS61tOc=;
 b=SIABEeLcxwe2l21sl2vfYhAlOZ3Cl+KXcqZjgxTjbJ4JG66MASXu+DfPo7/fJmW34zJ35Ta4arsNrWiyykPKOb6DAUclDsVJOlNjvbRb15yagtQiUjkBG2UQNTtMFobdNBtEQOqZ3UnKVXnsU1Mt2RpegjOxYLtU03YierrTvSL2mC5CvncabD3NdLhHNurcsWNmbdA6Z5LBemrHmaaiGCva9ylODM7F2e1zE4hWslRYgwQgD+EkwyoZIMJN8zx0IbP4NaQ5TRAEzCMmal/sFUIDYuH4qWj4rflrfX/uKU+X5YdssjrbnJrOfH3V1hq4DLfxSWTjkxoNcLRLKmJtyg==
Received: from DU7P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::21)
 by AM7PR04MB6789.eurprd04.prod.outlook.com (2603:10a6:20b:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sun, 3 May
 2026 14:49:13 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::b8) by DU7P191CA0021.outlook.office365.com
 (2603:10a6:10:54e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Sun,
 3 May 2026 14:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9 via
 Frontend Transport; Sun, 3 May 2026 14:49:12 +0000
Received: from emails-521574-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-105.eu-west-1.compute.internal [10.20.6.105])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E20287FD2C;
	Sun,  3 May 2026 14:49:12 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May  3 14:49:06 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xskD5rNmgz7QWP71+teYfR2j9B/6o07aXcUp1buiR+1dGSIPXT8I5kQQsAEmj/9Y3X2G+yioV2Mc89vHG1Qz2v8pU3VpjPjNmvM4qaVvh+8ZejmqK8LmMvQZ9ugz9XI6I0fQxLEyCYx575PvDkZCxBAQZQA8r+9dWqXXQdXnyb1hPENB1hSBFjDSRAb/dY1pr+KtonEHkQRN7pzqFr4Osj0seS3BUFdfvT0U1FeYG6GnLEtRApRaYXvO4H1XErLXXhcP1PQp/krB1HbzWl4hVnUdhUJT8nZXDufD7RmaZhAtzLdoj4JM1mLsJMad/RooHdI65ErbtqmTVma6UOQhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYlz3x5P9m/E3zjlW6xPHgslo5Hk9+i4kpgRdS61tOc=;
 b=icL5oI21IGDzTCvSVnMOoPj8Ff2r5/iwszJT3X4MR3rGkjw7v+BBzBixKOIAUY0egICo4AnPnKNPtfJt1bvqqKqhEqZiYOzFAIizkZ5mDeqXQ8Yj0GS8aCfQT8/As8QADYb461vtl8SKA4dGpPc+8e7bMOuZSOn7vQNOXgV3gm4evSAJQv4M2FaGfwn44CUsKjd9eYaxmzr0W6pbTgUsHEHTggqwobisC+6Q9ph8RbwHC0y5zU6vElPM3OyRttjPK2XSph1jtEELFpjdewkZYvHXSs9TXLrF05//fuFjxnGnU/wjvrgNBk7956s3B4DGuJ/3RQHwW16tYJjmcEyBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYlz3x5P9m/E3zjlW6xPHgslo5Hk9+i4kpgRdS61tOc=;
 b=SIABEeLcxwe2l21sl2vfYhAlOZ3Cl+KXcqZjgxTjbJ4JG66MASXu+DfPo7/fJmW34zJ35Ta4arsNrWiyykPKOb6DAUclDsVJOlNjvbRb15yagtQiUjkBG2UQNTtMFobdNBtEQOqZ3UnKVXnsU1Mt2RpegjOxYLtU03YierrTvSL2mC5CvncabD3NdLhHNurcsWNmbdA6Z5LBemrHmaaiGCva9ylODM7F2e1zE4hWslRYgwQgD+EkwyoZIMJN8zx0IbP4NaQ5TRAEzCMmal/sFUIDYuH4qWj4rflrfX/uKU+X5YdssjrbnJrOfH3V1hq4DLfxSWTjkxoNcLRLKmJtyg==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB9639.eurprd04.prod.outlook.com
 (2603:10a6:102:260::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 14:49:04 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 14:49:04 +0000
From: Josua Mayer <josua@solid-run.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Jon Nettleton
	<jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] regulator: raa215300: add support for
 configurable 32kHz clock output
Thread-Topic: [PATCH RFC 2/2] regulator: raa215300: add support for
 configurable 32kHz clock output
Thread-Index: AQHc2k29cM/V2zy5/0StYCooPklNNrX7euaAgADodwA=
Date: Sun, 3 May 2026 14:49:04 +0000
Message-ID: <01bf5fdd-17f9-4ee6-95a7-561f715ec387@solid-run.com>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
 <20260502-raa215300-clkout-v1-2-fd1c2a240963@solid-run.com>
 <afadX4IC9o-zj6qC@sirena.co.uk>
In-Reply-To: <afadX4IC9o-zj6qC@sirena.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|PA4PR04MB9639:EE_|DU2PEPF0001E9C5:EE_|AM7PR04MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 4014ff69-87b7-4528-e657-08dea923243c
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 xGSHjmuQYbZJnWg3nDR5gk5UrcKVfvnStzl2fsucpZ27PJurwZ6+oW0aHL7/hibhQzBNDNRx390wRMxVOHHNaGVVLoT9Pjrt6VVq5b64araB/enbhMh5FOr6ZhA9tAiK/0AgxcwNfhJ69hHWaS3PZFC5/JkoP+W3E3vAhlIyT/P0HausSp8OdmRMymxKlW2AlNVrf4E35L7q15D26Ib2M0XiIfTFrZu64iwg4uGpxT6/jUL3YUVuMoFvwb5ei1QbzB6TDSnPdj++0iWgTXMd+2cDyf+mkkU818kYM6tF+KGwMk6x7J9O8nOsZaeaIx8eEWSy6GiFgvW4DRvcDE3l74/Gyl4XuN6szCgrBvXs+MLdbL2Fq3wYSVEyQ45juazf7FUQTsvUgis+ppo84XtEnl69HlbSu4wa7oRy1DfyFVSZqQZ0An8dn1LixugKKNE4JW1TfZud4Iaq3rb07sy3Z1zPv7JJ3Z+wwqe7gqwJSRj/x4MnGsqbV6v6aj3O10OOlXoq2i1o4MT0mr1s1okbQxkVyfJLoptw6kxQqxF9l2ufu23rDGCr4azjjtZxDkQwqsRGOJt0KuSToy38GGcHOt6zO/Bj5d1N6NMUfLCLTdQ6iTUxqdXbKHKvPA6fpBTaIHzB5rhHoKZZAp54d/K5zt/CnSWSwPNF66T8VVldQ5vk6jugJgFdlCBuGOqpa+7eYwuIqWPcdBveVhy8Jg6S/nn3W+U8lCfGrll3qYVjH3SnfUHwBaU1MI9kOlUtC89o
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <87D2F37D11217542AA592BD2B9B831BE@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 D4YFIoacl06TuRwxljDAMsdsO2bMaS6SYiP7yuT+8VQYcQeD2bS9xzcIlBMEFg+2m/bQNs2QvkKxJZzCVIrEHkc3G301xLFkasrBV6V+q1FTWa9jj/OUvUpwNRUpN/j7jctQDgm/Q0599T1GNyfcFOlJ3dTz9wVfnA37zUoaiVluA8D6VT3svrpAuW2HblKGtsBw3a/s1US47rkbaBm8hJpNOqCHRwXadLTRBCo1HYbamvcnxx3kpwWknmU1tsuab95WuDtrgE67y/xmPX4p+vfOXHQ5VHQd9lEJmZcP0dN0AO72+Wyp2JLPoJB2rNz4Lpi7oZKzAQpqK/ejSIfabw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9639
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3ad74aeb906a4d4f9f2eeb61a8b71605:solidrun,office365_emails,sent,inline:52cc2c17907e1f9762cf1cd9eaed627c
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13dc60f0-e768-4030-8513-08dea9231f29
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|14060799003|35042699022|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ke7G8auNaN628RXnLNivOLfZkSEpiI3QiCk+KfwUZrUpBEz+HgRPJQs9KF2YQ5i5xVzjq6jD1HYhZNmSUFht2vNzfKkkVWcgLmeNBnx4IJ/+keqgJ74B6f3+SEsoYSvpssru9jbTSwTQAcmpJ461GlvZ1KWr9XdQXx+4BDHGDRqt3805hqy2DmU3gQ8gPYSPoPVPjgEPdsoNsTkP+wxvg1wiQv/a+dWKnJhPTXgsff8CxByvRLALGfBDKJCCvQrk0PjocqqiMxRklBgf+U2zMS5binDO1GEEpSbAkNAbth3I7bqIQ4H1Ey3jKWMbcs14pI3YteiBU3mBqiYAyEfL0WNFJ40BYno00vg6Pp8/FPb7Rq9GyyHJqfvD1qJ29w/YY7E4HA6hyrruMelXxL5Qx2xidwTDDjOaEmopb2ewdWSK0SfNPjGZPbv+hbwxH7AOUs8gYyrEbKCJoP0q3aqgHu0FgLErLeHQlP1KTzJcwhxliD/HiecE+3qvQkoEvRJGs7dBCRWZvTVl/vhttBDGA2UAgbN39jSxT/6Mgwd6nT34TsgvofKQLmGTniGuzjePGVKtlWwPZ4BNB0JfgzoNql1lz3T7seTo8cpy8jr8f7qNYqcfLdchMf3IdANPwY/JpHSDVf7qDf5vNWkDe41XlVp4K+EDvv2L6k1ScSLtS+yUTf27TQ7nK3DBvswJparCqFJMxdKHoSX9RDtyH/tuJ+NiXrOCnYwA1b3TEH+DM0w=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(14060799003)(35042699022)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Td/dHMJiQ1Kzt6a/F0kNGNbBaedlSi5AihBiRzmlD/yxgZteLE4cQViWjVeCEV/51+XAx6fs0T3iq5UtYx9Vh5MJCE03lItL6Xi3rdheZyF+dcgRHKbqoOIO7H+N3S+KggV1qQ5HVmKQ/NwQd4dPRsLtkB7u9f1REro2ve3ALyIRgCiMt3OBXsnJp/qakyUUNsIMHd7Xqg+7iIM4XYx7NgghlJTSYL6jO7XuqOQNqcBH6n9UsUdkA2i5HjX0QKTiwF47MBDNYQQ14Ee2w7FJ7ZTGkNZ8tuZLUmrjlGxKc0uxk2Qn/m2QXnFOL0ENU/wvr7JzIR6cciMKgHSAi60euk+/8F2TxsNYpalE3j6CenYbFgRE93NJ6cKBwerE9VSmmVkORh4OzjbEj/mJ4P8/VL/YorqdpoYMMfkaAamvhSksV+/Y0ePuh+psOH1CqTn
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 14:49:12.9680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4014ff69-87b7-4528-e657-08dea923243c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6789
X-Rspamd-Queue-Id: A3DE54B61EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-31900-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com,solid-run.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,solid-run.com:dkim,solid-run.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

QW0gMDMuMDUuMjYgdW0gMDI6NTcgc2NocmllYiBNYXJrIEJyb3duOg0KPiBPbiBTYXQsIE1heSAw
MiwgMjAyNiBhdCAwNjowNzowNVBNICswMjAwLCBKb3N1YSBNYXllciB3cm90ZToNCj4+IFJlbmVz
YXMgUkEyMTUzMDAgUE1JQyBjYW4gYmUgY29uZmlndXJlZCB0byBvdXRwdXQgYSAzMmtIeiBjbG9j
ayBvbiBpdHMNCj4+IG11bHRpLXB1cnBvc2UgTVBJTzIgcGluLg0KPj4gVGhlcmUgYXJlIGluIHRv
dGFsIDYgY29uZmlndXJhYmxlIG11bHRpLXB1cnBvc2UgcGlucywgaG93ZXZlciBvbmx5IG9uZQ0K
Pj4gb2YgdGhlbSBzdXBwb3J0cyBvdXRwdXR0aW5nIGEgY2xvY2sgaW4gb25lIHNwZWNpZmljIGNv
bmZpZ3VyYXRpb24uDQo+IFNvIHRoZXJlIHNob3VsZCBiZSBzb21lIHBpbm11eCBzdXBwb3J0IGhl
cmUgdGhlbj8gIFRoaXMgaXMgc3RhcnRpbmcgdG8NCj4gc291bmQgbGlrZSBhIE1GRC4uLg0KDQpJ
ZiB3ZSB3YW50IHRvIHRyZWF0IGl0IGxpa2UgYW4gTUZELCB0aGVuIHRoZSBsb2dpY2FsIHN1Yi1k
ZXZpY2VzIHdvdWxkIGJlOg0KDQoxLiBwaW5tdXgvcGluY29uZg0KMi4gY2xvY2sNCjMuIGdwaSwg
Z3BvDQoNClRoZW4gdGhlcmUgaXMgdGhlIFJUQywgd2hpY2ggaXMgbm90IGEgc3ViLWRldmljZSBi
ZWNhdXNlIGl0IGhhcyBpdHMgb3duIGkyYw0KYnVzIGFkZHJlc3MsIGJ1dCBpdHMgcG93ZXIgY29u
dHJvbHMgaW5zaWRlIHRoZSByYWEyMTUzMDAuDQoNCkFuZCB0aGVyZSBhcmUgc29tZSBtb3JlIGNv
bXBsZXggcmVndWxhdG9yIHN0YXR1cyBhbmQgY29uZmlndXJhdGlvbiByZWdpc3RlcnMuDQoNCklt
cGxlbWVudGVkIGlzIG9ubHkgdGhlIFJUQyAuLi4gYW5kIEkgd291bGQgbGlrZSB0byBhZGQgdGhl
IGNsb2NrLA0KYXMgaXQgaXMgdXNlZCBmb3IgQmx1ZXRvb3RoIG9uIGEgU29saWRSdW4gYm9hcmQu
DQoNCk15IG93biBwYXJ0aWN1bGFyIHVzZS1jYXNlIHdvdWxkIGFsc28gYmUgc2F0aXNmaWVkIGJ5
IGltcGxlbWVudGluZw0KcGlubXV4IGluc3RlYWQsIGFzIEkgbmVlZCB0aGUgMzJrSHogcmF0ZSB3
aGljaCBpcyBkZWZhdWx0Lg0KDQo+DQo+PiArI2RlZmluZSBSQUEyMTUzMDBfTVBJTzJfUE9XRVJf
T0ZGX0RFTEFZCQkJR0VOTUFTSyg2LCAwKQ0KPj4gKyNkZWZpbmUgUkFBMjE1MzAwX1JFR19NUElP
Ml9DT05GSUcJCQkweDhjDQo+DQo+PiArc3RhdGljIHZvaWQgcmFhMjE1MzAwX2Nsa191bnByZXBh
cmUoc3RydWN0IGNsa19odyAqaHcpDQo+PiArew0KPj4gKwlzdHJ1Y3QgcmFhMjE1MzAwX2NsayAq
Y2xrID0gdG9fcmFhMjE1MzAwX2Nsayhodyk7DQo+PiArCWNvbnN0IHU4IGRpc192YWwgPSBSQUEy
MTUzMDBfTVBJTzJfQ09ORklHX1RZUEVfSElHSF9JTVBFREFOQ0UgfA0KPj4gKwkJCSAgIFJBQTIx
NTMwMF9NUElPMl9DT05GSUdfRlVOQ1RJT05fTk9ORTsNCj4+ICsNCj4+ICsJcmVnbWFwX3dyaXRl
KGNsay0+cmVnbWFwLCBSQUEyMTUzMDBfUkVHX01QSU8yX0NPTkZJRywgZGlzX3ZhbCk7DQo+PiAr
fQ0KQ29uc2lkZXJpbmcgSSB1c2UgdGhlIHBpbiBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIHRvIGVu
YWJsZSBhbmQgZGlzYWJsZSB0aGUgY2xvY2ssDQpvbmUgbWlnaHQgYXJndWUgdGhhdCBpZiBhIHBp
bm11eCBkcml2ZXIgZXhpc3RzLCB0aGVuIHRoZSBjbG9jayBpcyBhbHdheXMgb24NCmFuZCBkb2Vz
IG5vdCBzdXBwb3J0IHByZXBhcmUvdW5wcmVwYXJlLg0KDQpUaGlzIHdvdWxkIGFsbG93IG1lIHRv
IHNraXAgaW1wbGVtZXRpbmcgYSBjbG9jayBzdWJkZXZpY2UsDQphbmQgaW5zdGVhZCBvbmx5IGlt
cGxlbWVudCBhIHBpbmNvbmYvbXV4IGRyaXZlci4NCg0KQW55IG9waW5pb25zPw0KDQo+PiArc3Rh
dGljIHVuc2lnbmVkIGxvbmcgcmFhMjE1MzAwX2Nsa19yZWNhbGNfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywgdW5zaWduZWQgbG9uZyBwYXJlbnRfcmF0ZSkNCj4+ICt7DQo+PiArCXN0cnVjdCByYWEy
MTUzMDBfY2xrICpjbGsgPSB0b19yYWEyMTUzMDBfY2xrKGh3KTsNCj4+ICsJdW5zaWduZWQgaW50
IHZhbDsNCj4+ICsNCj4+ICsJcmVnbWFwX3JlYWQoY2xrLT5yZWdtYXAsIFJBQTIxNTMwMF9SRUdf
TVBJTzJfUE9XRVJfT0ZGLCAmdmFsKTsNCj4+ICsJdmFsICY9IFJBQTIxNTMwMF9NUElPMl9QT1dF
Ul9PRkZfREVMQVk7DQo+PiArDQo+PiArCXJldHVybiAzMjc2OCA+PiB2YWw7DQo+PiArfQ0KPiBH
aXZlbiB0aGUgbWFzayBhYm92ZSB2YWwgY291bGQgYmUgdXAgdG8gMTI3PyAgSWYgbm90aGluZyBl
bHNlIGl0J2QgYmUNCj4gZ29vZCB0byBoYXZlIHNvbWUgdmFsaWRhdGlvbi4NCkRvZXMgaXQgbmVl
ZCB2YWxpZGF0aW9uIGlmIHRoZSBtYXNrIGlzIGdvb2Q/DQo+DQo+PiArCQkvKiByZWdpc3RlciBt
cGlvMiAzMmsgY2xrb3V0IGluIGNvbW1vbiBjbGsgZnJhbWV3b3JrICovDQo+PiArCQlyYWEyMTUz
MDBfcmVnaXN0ZXJfY2xrKGRldiwgcmVnbWFwKTsNCj4gWW91IHNob3VsZCBjaGVjayB0aGUgcmV0
dXJuIHZhbHVlIGhlcmUuDQpBY2su

