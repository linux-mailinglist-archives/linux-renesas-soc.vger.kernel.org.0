Return-Path: <linux-renesas-soc+bounces-14945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F561A7452E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 09:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B31E189BB42
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 08:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF067212F8F;
	Fri, 28 Mar 2025 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b="MUJXHNVL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07393213232;
	Fri, 28 Mar 2025 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.143.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743149705; cv=fail; b=Ls4UbQjC5RmSOvX1nSs2Mya0T0ak6FW9G2RulWIKIXIe5OzvAwxx3b3jdUFupnPV5zPwqeqmFXdUtTcVQINeuIzxvmHYFb6hnsstC5EaY7wduRNIqU9fKR7v7hU8fZWPzRn8clVnFepA/idZbyHOw5a52jGtaXnYLk8kj6NdDNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743149705; c=relaxed/simple;
	bh=ZUKruIthJN3jHf73oCF99kJEAngWnw/hy5lmtfTPzHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MxOJUUVKS4z9Hoj6PgcctpJopzIG05/0ovqXVJXdAqBnYBtaJxZ9DFZHjnqhJwFg6gs4RTUL+s+QsjalFCUDlBeGv05SIicSFnkmYK8fIPMeORQPxUSnoktv1m35hGrCoWoQdQ0ZS80tZMEU9Qj528+UfqcGCKWPSDbMn2SoVXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com; spf=pass smtp.mailfrom=sandisk.com; dkim=pass (2048-bit key) header.d=sandisk.com header.i=@sandisk.com header.b=MUJXHNVL; arc=fail smtp.client-ip=68.232.143.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sandisk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sandisk.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sandisk.com; i=@sandisk.com; q=dns/txt;
  s=dkim.sandisk.com; t=1743149704; x=1774685704;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZUKruIthJN3jHf73oCF99kJEAngWnw/hy5lmtfTPzHc=;
  b=MUJXHNVLNU7P4KZKHgcipJPmE4b8GXz13nwy3ai9JiDhXfs8huN26DfG
   tX7sTlizZ40ih7Ec9CZEtyWJ8jVaLU2NkX3lgtC2eTJl8pt3wl+uagHJV
   N7TwiQA6056E15p70+9I/s6usOEeXvLv+sCZMPBlNkapQ07xrZXuMPaa4
   kgY8rALtfR66d6GizbpICh3LOFuP9txT66PrVbCUaxDLTgQvDkH9c0uBj
   m57DcntYCefQrI0mydLRgWfBF3Eb5gLuOUPIxV2o314QcdoeVHIDTj0Xb
   90IgNjn02jtc0xOysOuadm1MUhkw7jq7uOBcis0HilcPSNmq5h7YkAVte
   Q==;
X-CSE-ConnectionGUID: LP07mJoDSPa7VJNwmaz/gA==
X-CSE-MsgGUID: rFHYRA4ARS6q3mTLy/Cc3g==
X-IronPort-AV: E=Sophos;i="6.14,282,1736784000"; 
   d="scan'208";a="66685972"
Received: from mail-bn7nam10lp2045.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.45])
  by ob1.hgst.iphmx.com with ESMTP; 28 Mar 2025 16:13:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Whaka4sHRLZTazkH0A8jDP70iodrKBwtPbdNLM/S15B3BjczJT9D+NIE01u0XVqkgc+LwKbvpV66ZWduAaYT+GaEy9xgckyl2oZGFWavSsdyRQ16QaqqEsIgCgxnHAvjcxecLsoj54tYjRZjMj1lL/Z2SqX5Cs5tWeOXp38U2tq70n2gATS0uokjQU/q6yKQGVp00VdaYNZDZSvWCE4lT3RlwXNdkm0PxAatkkUnmD55e/RPzhrTJwZsLDg1Z044mLJaCrAYkrYSj+kf7znVHMcU7H3CTFjPgGwHKwP02haGolWzLOjBf5JoRBKw+g/J6xZZX5LZRMpVT8jd53p7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snbgJKPB2EL/7UhfptzJzCFPEtxUeZ4e3+qL38Zj59M=;
 b=nhVOUIq6fhS97ISAe5stGgdXeFZ7OclcQRmsJ1MCRlJj7IEZRkz0uWtl79HaWo5rTsLzxiIPQUPgC+s4HW73LsIzBqdpnhrl/uLvLorsq8KUAChOQwfCBcPOGExvMDT6icbewLoMrqFttwE18SQuLuamlY8/5sLLScaR6SsqM95m+jWpz5Z4C32Qu+8Sx0lhtkv01u/OetHqxnt4g+06IvbJapdGgAJ65nid+vWO+W9jWxWhaoLbBzZogSRTuiClpwjOKGKUPeQY8M8qVvH3TIsbJtiHbMBfocSMrU6avSkhQ2IoNGq0b+ZC34RAuRfL9/4ZCq8aXBuvFEiZi4Y8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandisk.com; dmarc=pass action=none header.from=sandisk.com;
 dkim=pass header.d=sandisk.com; arc=none
Received: from PH7PR16MB6196.namprd16.prod.outlook.com (2603:10b6:510:312::5)
 by CH3PR16MB5371.namprd16.prod.outlook.com (2603:10b6:610:164::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:13:54 +0000
Received: from PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d]) by PH7PR16MB6196.namprd16.prod.outlook.com
 ([fe80::58f:b34c:373c:5c8d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 08:13:54 +0000
From: Avri Altman <Avri.Altman@sandisk.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/5] mmc: core: Add support for graceful host removal for
 eMMC
Thread-Topic: [PATCH 4/5] mmc: core: Add support for graceful host removal for
 eMMC
Thread-Index: AQHbmaDA6ElM3RYUnE2WLyxAuAHGMrOIPHrw
Date: Fri, 28 Mar 2025 08:13:54 +0000
Message-ID:
 <PH7PR16MB61960D396B3E5B61571F7F82E5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-5-ulf.hansson@linaro.org>
In-Reply-To: <20250320140040.162416-5-ulf.hansson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandisk.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR16MB6196:EE_|CH3PR16MB5371:EE_
x-ms-office365-filtering-correlation-id: 53561031-addb-4773-b906-08dd6dd07b45
wdcipoutbound: EOP-TRUE
wdcip_bypass_spam_filter_specific_domain_inbound: TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JjaBN7Vh+mNstJvSGD+u4XOJoqdI+rZS+YnZwoKY5iRmF++Z1Ql2XBFQcsVK?=
 =?us-ascii?Q?KHW8YNOYuSoTar4zOXhG9DVkH8w0h1LSyK5JMBVwGeuvWgLXlvX0q3Vfz19V?=
 =?us-ascii?Q?0NM+/BZHhJwHfmtBHFBHW9A9gOqrOPewj0IexZDih3o9nna1mbq1rZsGrImg?=
 =?us-ascii?Q?CUuN93J7+DyqHV0Fx5sHrnpIgiG4bKpE4xhSmcniFEVrgjx3pRvM8oGvFr5p?=
 =?us-ascii?Q?GFYzywaDLIPhcbyt296ojcbUMSwGoUuGQk2GItr1jhTybs6KXLUc5w7Lba+o?=
 =?us-ascii?Q?TWlYgcF5QN6K7Sf/WhE9v9p7y5vr3o/XJ7Br58fry8VQDa04rr7Awjvoxc1R?=
 =?us-ascii?Q?Oo7+y772vIUYXyBNIhy0zQvB7o7tK4af0KJsiHMdL+zln3fIz5AtGArbsUxS?=
 =?us-ascii?Q?cBjXLspGhX8bi7HzvG8fyWkXzo1QVCSqqaS9uBITVAQ6yEacRnB8a76mfu6z?=
 =?us-ascii?Q?aU36wLIC7yejAY0WY3l85OI6NT7klB7A9VCU3/YYYTY2sy1naY+Skf7WhnkN?=
 =?us-ascii?Q?f8qKhbG1K6S0bomWlm0a3NopBHCIxwQSdQoZ2NSjZJ0o5QKjNnp8buTjXD43?=
 =?us-ascii?Q?rUmmv3lCXH0u4fZSs3tLVJU9x85ZcCPiCv+RMUikTldvYaLZvxEOnwmDnuUy?=
 =?us-ascii?Q?iCR2urb/Jyh2x+Y/NiTyP/sO6nn6sqXZCfsWQ3OBGGWG5+RQclHu4Zp6mrmA?=
 =?us-ascii?Q?4sJB5b4knArOFHyt7MBNr4PI26oUdChIl5FOjBaT4vNnOlEKxYcmBRuIfg7r?=
 =?us-ascii?Q?+Q4ipNrQLI3ccKDGJlIvXQhiY9VeW17HhVr414E/hTLSz2WxmZYXB1aiCv8S?=
 =?us-ascii?Q?zlDSXmHhpcItFQCydNniYdQ74hpZiYI15owSwjow4qtO/rIHcXIO6W8nBYv/?=
 =?us-ascii?Q?E+ratCLGgksJ9gCzxQqnI9o5FWlpSBRIVGBNNcBmx3SIJ1gQ4ljZE915LIdY?=
 =?us-ascii?Q?4ljUmGiLYhb6iblRaqUNXjdieUWkNpI9AYQdQWpUXQyKQjt7H3oN2C9YOjsF?=
 =?us-ascii?Q?Bto20OGG7wgKTkr3xtV+wkkBBlKHpLbTJURJk+J906oO0Qku1F9OV8AFHo/N?=
 =?us-ascii?Q?EG1nSw9/mCsnOnfGtr5n8c5d0xfqaha/pqt2GdSWpXdL2MXUqMIcNshaCxdW?=
 =?us-ascii?Q?hOG5PFkCfUVS3aeV+mfP7c+LpM7qzTS+V1dxgmcwF5srqztbZ3Z28D/zcDaO?=
 =?us-ascii?Q?cMcO5blXtCewbVzuCVA+9pMDHLFUTa5hoUxhLtLjVJ+J118j4epcg1ypochd?=
 =?us-ascii?Q?G+q54t5wNd94bUQ+kYePNcZezap/EPm7rblYQT1EOGFRO2ewHxBaz7Lxpk4H?=
 =?us-ascii?Q?WZHPpaPKoqcGdCXz60+jwhV2MtjQqqExjcMRucUbUGsQd/LKtBCy5x3pa3VZ?=
 =?us-ascii?Q?PpTqoZmlaFGVWLmjTLTpTEsqfyf1PXoqYqoCvWAuMiccbINQYGgYfVyn7pXZ?=
 =?us-ascii?Q?mWg7TKbN5E1izfDt4XgBIAE7E0ZM0CPf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR16MB6196.namprd16.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6xATEN59/pZ5wPgiWWSZlb4hUqIseZ7GrHoVBnHM2i6ODQb/9Ajg6yCAvvhQ?=
 =?us-ascii?Q?IHVd9tmHJ7UOnPUOPDDClEyRI0PXWoyaEiw5A01NBI8XVMagngfy8pSMzU6U?=
 =?us-ascii?Q?vlSoOZqzsTIiOOQKFgDRW5uyZB7eR+dqmvckPvbB1R7OpvAn8m/ovDmHX/+8?=
 =?us-ascii?Q?Tvmgc1vA3IgbBh9HOmmwbZ0CO++aD18vjwmAUraKQQUnjHk27MrIKBxZV5zJ?=
 =?us-ascii?Q?X5QJyOV7QIDSbwC26J29oE3UQ626shO9MCFi0m710XuB2W6W/+m+nP9bplNm?=
 =?us-ascii?Q?XpDcaEeoObvS7UWTFuDAk9R57XX3tTS5GdMgTuO9kDNh7pALl3/e0ClzIg8t?=
 =?us-ascii?Q?HFg3VKeGqTMH7q3dHh95D60YnfHQa5SXTi+BW/cA3rVX+PiOgqUJ656qNsug?=
 =?us-ascii?Q?8kKNVhn7FY2nhC6GY1HeXsxHg6qsn8CAFH2DOtMbD8gK8vhkkj04AXP7ZMun?=
 =?us-ascii?Q?S3p1dgXJ2PMFFDyK/6n6+5R4h4EElhsbwTwPDVVR+XeBzOopK4XggzfVNp0R?=
 =?us-ascii?Q?cm9KPYjZvEnszNvkdYpElYKAmg32CF8M822uI6OiFjQDa5TDSUyymZ3mxkjd?=
 =?us-ascii?Q?g5Glq6zucbedu0OVDHm3WHY7Ec1vMoGCqPxNI1fQSSBBKlIlYV6HKAw1nLFK?=
 =?us-ascii?Q?kTva3FKe/st0FQHkfMnEcs2Gz7f21YOX4LTs7ZL2AtfTvksLgIpBDQv0Pfbq?=
 =?us-ascii?Q?xoSMRkeXrNemvORznS2mD4WAowMqmu3kB21KSNJV8+Cnew4sSUC2uZezExfB?=
 =?us-ascii?Q?XuUCWLPq+DRBpOopfi3tCGwD6loluYU3yefL7D1PB+tFNLqM1m8gQO9tZIZv?=
 =?us-ascii?Q?coep3L8w5n7UCrw6J2Oh04ELz0kF6e+FvcdzrSqcERBUMaBFRAvnwMXF1+vh?=
 =?us-ascii?Q?cjHO9auvbIVW7eZ1LyBtg+J04MwW5XMMXBQ20bUEGPO837QYgTEfFAMJWLA3?=
 =?us-ascii?Q?BE/vclX6uLwlahFA2EWLAousw4jnEYNfHWwqVLDiyi4rdTIhyaPLRL/P6nVd?=
 =?us-ascii?Q?C5OX25cNmiilP5TM1RLU2en0ZFKjWg1wIFBoILLFg+BfDa5rRDCCF0ZC/IRK?=
 =?us-ascii?Q?tkUfITdyjo/JhUAiNWcnun0WmlNSdd16P40sTDBiVkcktfD3ZDCRT4jLdhXb?=
 =?us-ascii?Q?gl11KV+Vnof6fPlREMwkb0+Eoi3DJ5UjRns9HY8rolDXPrVHQ8q1EyvEAJpe?=
 =?us-ascii?Q?2MdncAaYKisSdZWrEpMcDgAv7qyhrTiYJG3tM5uAeAURzaWOtfjmwV3n4KOg?=
 =?us-ascii?Q?yPD2947ENA06r+g0alMMpNpHlwzBftvXnl1CSrQapef6UOZ9Ps/zrltN9U9w?=
 =?us-ascii?Q?G+r/Y+opd0y5vRHrGwT5nWgnRmoqXtZYOHwXHwCShY7NZa7+LR2cqu+lE/kG?=
 =?us-ascii?Q?9s5LhtJ02z80rupVRwq2XgtRCWws75o2JTAxBNadjeVtLw2ysuUl/0bMDfJT?=
 =?us-ascii?Q?KQ+Wt8U68S53+mefAGUeBQwIIbIit2HirRBwKDlDDA+BOVH5tskPdW+IN3po?=
 =?us-ascii?Q?lq8x4FZzOg7Wekj4UsupBBz2a9mIcOzNu1MLdeooHKAim75IXEspThj65SRa?=
 =?us-ascii?Q?s5+AxdDudMPrRDf0IRQPvTDD6ntQzjqs3sIYBcIGQdSNDlU5Jvb1GSPD4JVb?=
 =?us-ascii?Q?RYuxFpDU3LXNQfG5s57KJ2M3CYccwWsEaWvcJuUwsC7i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dl4rH1r6Q+pw4/zoAHJqOA+n4iGdIQFI932QCNCWWbojIiEzU4Gc+4jlwtSrQz3nhPnNmOco7U+KqThcseB2DHQtf7aVpMZn59ZTQc5sW5fOHn9Mv6pjfQ7oBEKmGHB/YNFbIGCi2s30Q5w55T6/aTbrElY8Tc2vkVnJs8tFtYIpfVG62HFX2EwHa6OQAkvyy/z1f6vREPhPjw26NFrmyknn7MMMvj48VaDfFJbUfpi2P4DuERaYjiuxrG58kiVcWmaU2lMRC1ymKpX6aVOyIkXirtmD8prqjSWCxIPaeCIZ5IseTk4TQ80b/Rk5RxZU6KIw8b6fUPvgoolGC4JD+v5U3NQhkGc/wd4IGBFp91/IO/Oh6WNH2XR0SMWeptrvrnjzuflYXBSmVkM0xmFeDJuWGQSjEWJ0VXt2SfCNsncgIvVFwMt8440T75g5Vz5F4q2LweVKeOfYyjre/9LamyQn43QRjPYa31+tG5I+ZLEzEqlrt2lxg9JWYRzuB4TQEyazS9Zj9R6Bf7+b5o9R/tI/H5Fvm3IY+1p4/k8wAX6sVrbsZmEcxF5WhroQSuJsx0ntqVdFv6gH4qtN+Ifn5Sb9Asz6os3NoED/JZ2nK3okW3KrHb0nQRoEl2Hjd5IAd8BjLG9GmmKgpQEAQb8nvQ==
X-OriginatorOrg: sandisk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR16MB6196.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53561031-addb-4773-b906-08dd6dd07b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 08:13:54.4720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ffe0ff2-35d0-407e-a107-79fc32e84ec4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIHKXo0AJ7DlMp/ExTdFsMQACkuBqPnAgKZXUlm5ken5U+C/yCB6gDDKWTjhKh+QBYanEpPis1MYITqOz1Ssiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR16MB5371

> +/*
> + * Host is being removed. Free up the current card and do a graceful pow=
er-
> off.
> + */
> +static void mmc_remove(struct mmc_host *host) {
> +	get_device(&host->card->dev);
> +	mmc_remove_card(host->card);
> +
> +	_mmc_suspend(host, MMC_POWEROFF_UNBIND);
Couldn't find how _mmc_suspend handles this new power off flag?

Thanks,
Avri

> +
> +	put_device(&host->card->dev);
> +	host->card =3D NULL;
> +}
> +
>  /*
>   * Suspend callback
>   */
> --
> 2.43.0
>=20


