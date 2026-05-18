Return-Path: <linux-renesas-soc+bounces-32744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SONdF9F7Cmqe1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:39:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDB7565222
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64F87300184B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC3A2DECB2;
	Mon, 18 May 2026 02:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="tJgu97dd";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="RY81k9P+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C3229B38;
	Mon, 18 May 2026 02:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779071946; cv=fail; b=T/eZB9d4NWDcWjhaEN9CSJDIiA/XzSo2SMtVxKswRte3phchWjT+0DnV2ZTyICz4tH6lPU8lGvtUIOXNwT8ekGxOFCExCABFcsYwbp/DKJyW4bjXSztwwkzJ6GhHWXFVcjfdcH4+/4I0YycXbKj0W5omQawXTVG5S7DO14Hk32c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779071946; c=relaxed/simple;
	bh=iacrVI7oeGIq0EAk3aJfyTxf28gkUEGHfVdpIQbuHCw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZBft1ZHP5mcw4QNXzK81+8zpxhS1at5VQEcxyhHADD6M+LZ4EhB3wP6I36Efr6wGIExg2tcDiOZJEyaSrYZ7YYUfJckq5cP/gGCrHfoJaNKciQ9oyPHKicOzPI10zdvwPI185jmqrUx+WpuQhGlkd0V/dajUE36KZEg2sHv5oZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=tJgu97dd; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=RY81k9P+; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HLjVTi3288038;
	Sun, 17 May 2026 19:38:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=iacrVI7oeGIq0EAk3aJfyTxf28gkUEGHfVdpIQbuHCw=; b=tJgu97ddaB16
	OcOKXyNayMNIGWdpmYv0ibU2wGjABMDcuVvcHBUVejhIgmDETGKDrqajt4lzDslF
	Jh2Lx4msE6PZCGa3Lh3Tz1tqGTmDsxK+2TcetJjj4nuUcNoauK794/80c+K+1247
	sOMEPFEjIntKebXAM24ZYe4eQ3Rc9hn4YokE4JBAW8uF0dc2SvhPFcoBGxSA7kbf
	/HLjUAG4PCmOKGyiuPFxRrVJeEjA5X0CtmPhjhGhMoqS4YFB+j6RGGHXfGHeACIY
	3PDjJkFDYBT3+/l9Ub0pFv75xawhS7kk13CNWXuNJOp5WCRwwNUWfd7v/79T1KGL
	kYFXfWLggg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4e6m5uc7x5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 19:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGpgPtEzGgQR/ff8GjuRJraYSdzbnZYxk5XqlyQQlhYu1uaonvIV+xmO/j+JJeZu3wOTdgHkyFb3XIJUS1UU6JlSOOFk89V6A+Q3Y2vX6bddYxJXU+uTXBHy4Ak+4b0Fd0+PLK/W9ELByRZDIJun51yGQKLBEr+5NeTtHfo3UfG1VxUAF4dV80qnuX2B0MStBU8oXapGpBkeE5ymMYuIsAAEothk5RaSxK4I6X+ipIlpNiSq7LAoRfBy8QYt/JjU7ksZhA7Mz1ac1DpG/pVRs/YrColpoo6zYwEezHN+UfLMqM2LCWHnqPaUEVVIaKL5mh6QRHO3p04VbXVrG9UvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iacrVI7oeGIq0EAk3aJfyTxf28gkUEGHfVdpIQbuHCw=;
 b=fE/+kX8il0q88g9xj90sXLp4hJPt1rf0k2Q2hSJ9f+Y4muCsSJMZiJQCckWZGn64JpPzCeEQm8fevrGO7zoF533V55tRoWbAmB2beue6cOBUzffsS48Oa9IomXrrzlq7hCTUIdKJ8/2H+9cObLbXGHy1YeG3tc/qJyOJmZTf2ImTSmyfYvJSEbJWCUwfJAcutLodPPmddSZCqxV7bMaWCro6oxbaqTJEnMtu3Xx1/pkUrGUZxGmb/z3LES8RCl1y29T/XVn5ICRs0IG7qegGHi2fqVBiqYg2GCeiQcAFbtOfBoUQrPYZBXbxhuoZ8iQxUE6hUkdAeT/VhoeHWh2aYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iacrVI7oeGIq0EAk3aJfyTxf28gkUEGHfVdpIQbuHCw=;
 b=RY81k9P+dLBRk0wvBAcNsekQGd19bQDdx8uzNJ9urvbRT8cL5gzfv3Vs9pQi3Ja9KbEwlAELEa700vFfnZ9s8t5ycEztgQtKl6LO/1cRuhu04+NmP63teucS4HMh3A+uBpFR2x4+JrOUXI7hOAqlS36MzkrGEoGwA7e5ruMWkuaT3CXzSLi7s6CkCfM14i5nP1Gz6nKxWDYV5bsAxsI4qhrn1f5f6wlk//qltenBN/hPdFSNLpzg6CL30P7tvg0lOI/GWCTl+4HUnwf9KSNiEcnwjTy3wjk0AzEFIAjcBqLkdAuRj5S7Fa0vq6Rdtu1GabJxp5HzaVShFIH+9PGrRg==
Received: from DM6PR07MB6716.namprd07.prod.outlook.com (2603:10b6:5:1c9::16)
 by SJ0PR07MB8565.namprd07.prod.outlook.com (2603:10b6:a03:35a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Mon, 18 May
 2026 02:38:40 +0000
Received: from DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175]) by DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175%3]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 02:38:40 +0000
From: Manikandan Karunakaran Pillai <mpillai@cadence.com>
To: Hans Zhang <18255117159@163.com>,
        "bhelgaas@google.com"
	<bhelgaas@google.com>,
        "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>,
        "ryder.lee@mediatek.com"
	<ryder.lee@mediatek.com>,
        "claudiu.beznea.uj@bp.renesas.com"
	<claudiu.beznea.uj@bp.renesas.com>
CC: "robh@kernel.org" <robh@kernel.org>,
        "s-vadapalli@ti.com"
	<s-vadapalli@ti.com>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "claudiu.beznea@tuxon.dev"
	<claudiu.beznea@tuxon.dev>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and
 j721e glue driver
Thread-Topic: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and
 j721e glue driver
Thread-Index: AQHc5l9RsT4zyZPLJEykoM7+XPboKrYTCZlggAAFGICAAAKogA==
Date: Mon, 18 May 2026 02:38:40 +0000
Message-ID:
 <DM6PR07MB6716CC48016E6D44EC5FCAB3A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
References: <20260518004246.1384532-1-18255117159@163.com>
 <20260518004246.1384532-3-18255117159@163.com>
 <DM6PR07MB67169B65E6B826E24A8E64AEA2032@DM6PR07MB6716.namprd07.prod.outlook.com>
 <c909a890-65cb-444f-9b4f-9482d2f71c6d@163.com>
In-Reply-To: <c909a890-65cb-444f-9b4f-9482d2f71c6d@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR07MB6716:EE_|SJ0PR07MB8565:EE_
x-ms-office365-filtering-correlation-id: 58a5334b-3d62-424e-bb04-08deb486920a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|11063799003|4133799003|4143699003|56012099003|18002099003|38070700021|921020;
x-microsoft-antispam-message-info:
 NV1v6dBqivKVkx7NKkusglF0K+wsY0smucezRJHpmOLII3zdhREEZJUL/OtPMp/KAuKVccfaZ5vXMXq7i4B7uRKA/lhxYvZ7lxWr7O25OkMs3Kj2BXhiNCf8GVwJXdcQII8NPpk22hCcFgMF9ZyAEcMTpwaDhJ7P94Llj/ajIbO2rN9eBtgORrYRQ6b55Ji/S+JHdrZt0AYH5CHl14JFL/YCMLfDsRhRaQH0dJOObQRdFipDJcHHGIENsa0haCkPStqdQUGvAu5kSFqP2Gdan2ZTHUHjP4tAWXEP6vUIJ9Np+oJ3s7nEDmQiyvl+kL6gQ6Eq59yg2hwbyMT+jZIN2vqnhuXBY+CEyFklLOFFn8doxey7C1HzIJpQYyjirnODsfwCDVnWCe9L5nNkWbnehu7G4dHjqWvxECYEV5Pd6F7bJiygCEPEn8Rshhxk6uRsgiiaAs4lm42OntXQa9LUL6URjxnahLssSoTMqAFf9nYjvV7jbOKEws46VLuja1Osfa7IpKc6RMPWaKQxARqlFJ54GYISRDaZ8/Vx2p0yZsZhe3UNxdIXEtYKZMITZNqXc97rwC6QTk7waXkr2TFrcG7PvgLg3YfypJqfPXobaTXrvdlJn59YOVocHOgnfSNCGFIYFIo4YQoI2GGWrlnk1X9eeb7pf6OJA++HqLMk5boYjvX00jDtkA6+/O6AvEZHEXj3xWO+/hBq/MNdHeb9eA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB6716.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(11063799003)(4133799003)(4143699003)(56012099003)(18002099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QTZtSGQ5TTJvb1ZmYjRGNmQxYzhNeGxUb2J1Z1Z0VjFFdFlqQ2x2WDB6QW5z?=
 =?utf-8?B?MlFMWm1laHB2ZmVvejhtYUxXZ2NITUdUR3p0aW9McmRoNTYwL2xVc2tOaWti?=
 =?utf-8?B?WU9RbGxmVEVZblVTM0FZYm95V1ZyQ1drWTBlS0ZYMWNSV2V1Sm5EZXJvQzdL?=
 =?utf-8?B?S1c1SElJbk8xbk9Qc3hKR2M0bzE1YlhtdHF6am1kMk1TVnB1Vm9PNzVScW9x?=
 =?utf-8?B?M1ljYnB2RVdXb3A5N1FNZXJTVmJEdnhza284WXQvSFdLa1RWd2syaytIUE0x?=
 =?utf-8?B?dzI4bTI0Yit2NGwremJnVHhtaVNTaFFkWDAzdm1mVlRrTDF1Sy8wLzB1VE0v?=
 =?utf-8?B?WVpwMTdzc09Qd1RjWC9sY1pncnhjSWIvVGUzSHBkTGZlbUxsL3FkeUlMRTUx?=
 =?utf-8?B?TldkL2R6TEVjQzhiOFhkSWRCWG9IQU5VOEk3dzZTR1FNZU1EaHRyd0g3cGwv?=
 =?utf-8?B?TkRBWlZCT052Y2syd0htV05Vd1NpUG5jTFBxQzIvbnJGWVhaWVRFN01LR2tn?=
 =?utf-8?B?eGVZUXdEd1MrT1RTNXc1MU5hM2s3a2FuWWdudnRJOFpZYWFLQmJSS3RyaHhl?=
 =?utf-8?B?Z0kyV0QxbDVVU0Z4enhvK0lFWTU5MDJVTDh0Zzgwb3hQN1I3Z0ZqOW04SHhU?=
 =?utf-8?B?b1dPN1M0aGtzQzJVeHREQ04xbTdlOGtSVTZFWXBBRFM2M08waWRCQ1FpWXk1?=
 =?utf-8?B?bEkvSk8zS0pkZm1hWjlhUDFPVHcvV2VVSnlMQmFiYlAvK0pnYWxBem12ZkFK?=
 =?utf-8?B?Q2NwVmFZdmRlVTk5R2JXbk1aK0dFeXBjcDJ5N1dTSzdheWZvUnlpZXgrZThw?=
 =?utf-8?B?akVWMzlpV2g4SkxTZE5OeWRJMTMrMllKNDlzVlU4T2svL25SenR0SkRZS0No?=
 =?utf-8?B?bkJxbnlkYXZpYmgwM00wczJQaFozNEljUk9iaFVBVGc1R2dnZ1daU0ZOTkRP?=
 =?utf-8?B?dWhXS05ja09EUTBIM25FQWxXZWlwL0s1NjBZRmhydEJxSURWUDBxMytqbjU4?=
 =?utf-8?B?SjlhTmo4RldsWVB1bXpHNkgwMGpXN0ZTcVd5NVhaTitxREFRZlQreVdySU9W?=
 =?utf-8?B?dWFxdkc2SjdtYXhHZDRURGZmaytPaUkzaUgwMXNtQVFweXV4NEdxZm04ajIw?=
 =?utf-8?B?dG1XdWNwT1MvOS9qamswV2xmUWdKVHIwb0RkdnZ1MHhnTUg5Q0ExeXVUMVdQ?=
 =?utf-8?B?ZlFuQSswblBDZFZUUWIxZk9vbDl5VnNVbUYrM0xSdUtRdGdxWjRvMWU1dUVy?=
 =?utf-8?B?YmFMLzV3Z3ZUTG0wR1lrd21VSUxpeTRpc0pSMU9mSmU1UTZ1Qjh6NVBsUHZK?=
 =?utf-8?B?Y0psRmRZaWQrUTdkNUNyMVByZ0xRNU9TUS9UNTBZajY5T0txN1FFVlV2UEFj?=
 =?utf-8?B?bUVNVCsrTDdkU3NmRjF2R1R1TjZPOFUrRjR4aXlSWGpPeExoc1phZVVRRmJS?=
 =?utf-8?B?U1pheE55Z2FPRmRrcjI2dzlIbHlkdTVPV1V1T1hKNDRqNjMwUTE0OForem9O?=
 =?utf-8?B?bVpLNkxxeGJncWpMZHdyOUhRWkJvN3RKZitKWlJyWmt4K1A4d0NqelREdlF6?=
 =?utf-8?B?MXNIYUl4Qng3T2xSL1hzUEo3L09MSkJySWU1cWxxWmNuNXNkNlM1NVhyTjVh?=
 =?utf-8?B?VHgxZGZpRTd3eW9mZFBzdHJqN2hUYnV4cVQybmE4c2pnRjJLayt5c3NLZ3FL?=
 =?utf-8?B?eXN2VGs3ZG94ZTl0cE4zUk1pak5OM1VYeHlQMDRSdldKNlFFR1hRa1dQQlE1?=
 =?utf-8?B?dnlHaFFoby9GeWpyWjM4NVdLQkpxWGMzeEsxbVlrVC84c0NhNFNPYXNNNHFR?=
 =?utf-8?B?eHBRa29SVzF6OHlrN0tsVXFkTFc3SVNlRkVDKzYremVuTDFHYzIwZnp5MndT?=
 =?utf-8?B?aTVTT1U3MGRCYTFuN2UrK2Yyd2s2b1JTUXJHUHpBbURzRSs0cWFLYTRUMFpM?=
 =?utf-8?B?dzJKY3R1ZVNwVzVMS2RmMDNEZERWMWFYT0FiTTBIZ05VNTYxenFnM05UTHJp?=
 =?utf-8?B?SEdLN1lvVDNoa3ZjOHB0dEtkSDV0ZmZmM21vZ0h1UlYzNnMxdUZtOHRtNE1t?=
 =?utf-8?B?ZlY3Y0dUMUVWb1puK1ZmbVJJOThKR1JiUjV2SkdiRVRVamI5TmJ2ZURmV2pV?=
 =?utf-8?B?alhVajZaQTFGZkZsZW1DUHlHOVJpSEo0UjhKRFRRSE8rQzVyQXhnK2RqNTZH?=
 =?utf-8?B?c1JRbUtXS05KZHhzYTk0Q1gvU052K3pLeDVLbjg2Y2FsaW02QWsrckNxakdW?=
 =?utf-8?B?YkRxaW4xSFplSjBBdm91NHRMcXNRQm40RXM4elp6bWF3YVpnM1dKc2hSY1lW?=
 =?utf-8?B?UXFDdGxEV3ZFMkFZQXBXNHkwOHc4cW1vTldENVJ2TmJ0NXJsWm1RQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Ej8GX9I21aLJQK5Iu9YZKYA5NSu8SiJDZ2G6X/AQpaQt/B84edvS53MSKFwpbNASsgdgpzYqhDlErlKpd7C7eanW+nRFh2NBbsCsKYtaTgyKEUh81jzJ9O2Kgj056PtjLDjZERW8ZZAh2F6sb8+eyo/GaSn+FueEF+E1KJuGZCdelkbCbUOa1dr+BOXCU9c3cCWsSmmG4I7Qbtmm4FgjLcyOe7MZm31VxXQIwrzJ32YwPZllKxUZmmAJHn7yk55CZwaYFmmY0KvA6FzFNOtctzyMmxODwFmLb8Q67X6OEfPQ7QLMo+7FfwhNzatpGL2a0PXsag0Fzj/YY3ruMsMApw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6716.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a5334b-3d62-424e-bb04-08deb486920a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 02:38:40.1455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0cyBVI1qHGQf8BPCwpIuIL9cebhcgTlHD0Vwumy7hM9L2BvDX84kjvv6ZQcQiIHZrXK3ngP0PRZYYL2y7HHB2u/LDjpufROOizwBp8qH1qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR07MB8565
X-Proofpoint-GUID: rTbryr6J850bf7p3VjZQ_Sbt7CAV9vkl
X-Authority-Analysis: v=2.4 cv=ddKwG3Xe c=1 sm=1 tr=0 ts=6a0a7bb3 cx=c_pps
 a=miuBlqXM8bFb40OTON37XA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=uherdBYGAAAA:8
 a=9AdMxfjQAAAA:20 a=Byx-y9mGAAAA:8 a=9xj_xV3VQyHtDAbWhQcA:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAyMyBTYWx0ZWRfXzqo2pFGDnjOr
 QbJKkmJ7QdM1nX84MTsnRNhAZo+gXdMeddxf/wXmuzBLShx2qkWDj2+I74PVEk8WLXyrd8IVl+w
 Zi6h6SY6PRldYizAcwagp6ujrMOfpMBlsyu9pujWZmiW20FMajJ9nLKuVgTE2tnUtmOwwtaLaQA
 TXJy6bfoC2+jyGValOgBdI27rSFTqoEolDylu4GfhhEQJzOqCRO8/p9ySgujNHVlUtFLiML1+Li
 0mcmCy958z+IRtZy6BKJskrC00h4MvZ15ceFCh1U5dha65JjxYvutim5snSkxg4FD+31AkBw/yR
 ju20o92gt65dZ0TkpWP6AIeoKty7cnkAlE0W6Szouw4BFQESbUVuZSp6HJykcOvr9A+yVhvMkYi
 Bny3EUBaZK1yCjPD0647k/Id/YAUb3tl7/j/IE4tBfO4Gb1JKQiaarW/McYGkFpufjEw9roSTjT
 5Sb/7H48GM0+lvgaxwg==
X-Proofpoint-ORIG-GUID: rTbryr6J850bf7p3VjZQ_Sbt7CAV9vkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180023
X-Rspamd-Queue-Id: 5DDB7565222
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32744-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cadence.com:dkim,DM6PR07MB6716.namprd07.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpillai@cadence.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[urldefense.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

DQoNCj5FWFRFUk5BTCBNQUlMDQo+DQo+DQo+DQo+DQo+T24gNS8xOC8yNiAxMDoxMiwgTWFuaWth
bmRhbiBLYXJ1bmFrYXJhbiBQaWxsYWkgd3JvdGU6DQo+Pg0KPj4NCj4+PiBFWFRFUk5BTCBNQUlM
DQo+Pj4NCj4+Pg0KPj4+IFRoZSBDYWRlbmNlIExHQSAoTGVnYWN5IEFyY2hpdGVjdHVyZSBJUCkg
UENJZSBob3N0IGNvbnRyb2xsZXIgY3VycmVudGx5DQo+Pj4gbGFja3MgdGhlIG1hbmRhdG9yeSAx
MDAgbXMgZGVsYXkgYWZ0ZXIgbGluayB0cmFpbmluZyBjb21wbGV0ZXMgZm9yIHNwZWVkcw0KPj4+
PiA1LjAgR1QvcywgYXMgcmVxdWlyZWQgYnkgUENJZSByNi4wIHNlYyA2LjYuMS4NCj4+Pg0KPj4+
IEFkZCBhICdtYXhfbGlua19zcGVlZCcgZmllbGQgdG8gc3RydWN0IGNkbnNfcGNpZS4gSW4gdGhl
IGNvbW1vbiBob3N0DQo+Pj4gbGF5ZXIgZnVuY3Rpb24gY2Ruc19wY2llX2hvc3Rfc3RhcnRfbGlu
aygpLCBhZnRlciB0aGUgbGluayBoYXMgYmVlbg0KPj4+IHN1Y2Nlc3NmdWxseSBlc3RhYmxpc2hl
ZCwgY2FsbCBwY2lfaG9zdF9jb21tb25fbGlua190cmFpbl9kZWxheSgpIHRvDQo+Pj4gaW5zZXJ0
IHRoZSByZXF1aXJlZCBkZWxheS4NCj4+Pg0KPj4+IEZvciB0aGUgajcyMWUgZ2x1ZSBkcml2ZXIs
IHNldCBjZG5zX3BjaWUubWF4X2xpbmtfc3BlZWQgZnJvbSB0aGUgZXhpc3RpbmcNCj4+PiBsaW5r
IHNwZWVkIGxvZ2ljLiBGb3Igb3RoZXIgTEdBLWJhc2VkIGdsdWUgZHJpdmVycyAoc2t5MSwgc2cy
MDQyKSwgdGhlDQo+Pj4gY29tbW9uIExHQSBob3N0IHNldHVwIChwY2llLWNhZGVuY2UtaG9zdC5j
KSBwcm92aWRlcyBhIGZhbGxiYWNrIHJlYWRpbmcNCj4+PiBvZiB0aGUgZGV2aWNlIHRyZWUgcHJv
cGVydHkgIm1heC1saW5rLXNwZWVkIiB3aGVuIGF2YWlsYWJsZS4gVGhpcyBlbnN1cmVzDQo+Pj4g
dGhhdCB0aGUgZGVsYXkgaXMgbm90IG1pc3NlZCBvbiB0aG9zZSBwbGF0Zm9ybXMgb25jZSB0aGV5
IGVuYWJsZSB0aGUNCj4+PiBwcm9wZXJ0eS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMg
WmhhbmcgPDE4MjU1MTE3MTU5QDE2My5jb20+DQo+Pj4gLS0tDQo+Pj4gZHJpdmVycy9wY2kvY29u
dHJvbGxlci9jYWRlbmNlL3BjaS1qNzIxZS5jICAgICAgICAgICAgICAgIHwgMSArDQo+Pj4gZHJp
dmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1ob3N0LWNvbW1vbi5jIHwg
NCArKysrDQo+Pj4gZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1o
b3N0LmMgICAgICAgIHwgNCArKysrDQo+Pj4gZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNl
L3BjaWUtY2FkZW5jZS5oICAgICAgICAgICAgIHwgMiArKw0KPj4+IDQgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvY2FkZW5jZS9wY2ktajcyMWUuYw0KPj4+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9j
YWRlbmNlL3BjaS1qNzIxZS5jDQo+Pj4gaW5kZXggYmZkZmU5OGQ1YWJhLi5hZTkxNmU3YjE5Mjcg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaS1qNzIx
ZS5jDQo+Pj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaS1qNzIxZS5j
DQo+Pj4gQEAgLTIwNiw2ICsyMDYsNyBAQCBzdGF0aWMgaW50IGo3MjFlX3BjaWVfc2V0X2xpbmtf
c3BlZWQoc3RydWN0DQo+ajcyMWVfcGNpZQ0KPj4+ICpwY2llLA0KPj4+IAkgICAgKHBjaWVfZ2V0
X2xpbmtfc3BlZWQobGlua19zcGVlZCkgPT0gUENJX1NQRUVEX1VOS05PV04pKQ0KPj4+IAkJbGlu
a19zcGVlZCA9IDI7DQo+Pj4NCj4+PiArCXBjaWUtPmNkbnNfcGNpZS0+bWF4X2xpbmtfc3BlZWQg
PSBsaW5rX3NwZWVkOw0KPj4+IAl2YWwgPSBsaW5rX3NwZWVkIC0gMTsNCj4+PiAJcmV0ID0gcmVn
bWFwX3VwZGF0ZV9iaXRzKHN5c2Nvbiwgb2Zmc2V0LCBHRU5FUkFUSU9OX1NFTF9NQVNLLA0KPj4+
IHZhbCk7DQo+Pj4gCWlmIChyZXQpDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtaG9zdC1jb21tb24uYw0KPj4+IGIvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1ob3N0LWNvbW1vbi5jDQo+Pj4gaW5k
ZXggMmIwMjExODcwZjAyLi4xOGU0YjZjNzYwYjUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1ob3N0LWNvbW1vbi5jDQo+Pj4gKysr
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1ob3N0LWNvbW1v
bi5jDQo+Pj4gQEAgLTE0LDYgKzE0LDcgQEANCj4+Pg0KPj4+ICNpbmNsdWRlICJwY2llLWNhZGVu
Y2UuaCINCj4+PiAjaW5jbHVkZSAicGNpZS1jYWRlbmNlLWhvc3QtY29tbW9uLmgiDQo+Pj4gKyNp
bmNsdWRlICIuLi9wY2ktaG9zdC1jb21tb24uaCINCj4+Pg0KPj4+ICNkZWZpbmUgTElOS19SRVRS
QUlOX1RJTUVPVVQgSFoNCj4+Pg0KPj4+IEBAIC0xMTUsNiArMTE2LDkgQEAgaW50IGNkbnNfcGNp
ZV9ob3N0X3N0YXJ0X2xpbmsoc3RydWN0IGNkbnNfcGNpZV9yYw0KPipyYywNCj4+PiAJaWYgKCFy
ZXQgJiYgcmMtPnF1aXJrX3JldHJhaW5fZmxhZykNCj4+PiAJCXJldCA9IGNkbnNfcGNpZV9yZXRy
YWluKHBjaWUsIHBjaWVfbGlua191cCk7DQo+Pj4NCj4+PiArCWlmICghcmV0KQ0KPj4+ICsJCXBj
aV9ob3N0X2NvbW1vbl9saW5rX3RyYWluX2RlbGF5KHBjaWUtPm1heF9saW5rX3NwZWVkKTsNCj4+
PiArDQo+Pj4gCXJldHVybiByZXQ7DQo+Pj4gfQ0KPj4+IEVYUE9SVF9TWU1CT0xfR1BMKGNkbnNf
cGNpZV9ob3N0X3N0YXJ0X2xpbmspOw0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLWhvc3QuYw0KPj4+IGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9jYWRlbmNlL3BjaWUtY2FkZW5jZS1ob3N0LmMNCj4+PiBpbmRleCAwYmM5ZTZlOTBl
MGUuLjA1OGU0ZTYxOTY1NCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2NhZGVuY2UvcGNpZS1jYWRlbmNlLWhvc3QuYw0KPj4+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UtaG9zdC5jDQo+Pj4gQEAgLTEzLDYgKzEzLDcgQEAN
Cj4+Pg0KPj4+ICNpbmNsdWRlICJwY2llLWNhZGVuY2UuaCINCj4+PiAjaW5jbHVkZSAicGNpZS1j
YWRlbmNlLWhvc3QtY29tbW9uLmgiDQo+Pj4gKyNpbmNsdWRlICIuLi8uLi9wY2kuaCINCj4+Pg0K
Pj4+IHN0YXRpYyB1OCBiYXJfYXBlcnR1cmVfbWFza1tdID0gew0KPj4+IAlbUlBfQkFSMF0gPSAw
eDFGLA0KPj4+IEBAIC0zOTcsNiArMzk4LDkgQEAgaW50IGNkbnNfcGNpZV9ob3N0X3NldHVwKHN0
cnVjdCBjZG5zX3BjaWVfcmMgKnJjKQ0KPj4+IAlyYy0+ZGV2aWNlX2lkID0gMHhmZmZmOw0KPj4+
IAlvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImRldmljZS1pZCIsICZyYy0+ZGV2aWNlX2lkKTsN
Cj4+Pg0KPj4+ICsJaWYgKHBjaWUtPm1heF9saW5rX3NwZWVkIDwgMSkNCj4+PiArCQlwY2llLT5t
YXhfbGlua19zcGVlZCA9IG9mX3BjaV9nZXRfbWF4X2xpbmtfc3BlZWQobnApOw0KPj4+ICsNCj4+
IFdoeSBpcyB0aGUgY29uZGl0aW9uYWwgaWYgcmVxdWlyZWQgaGVyZSBhcyBkdXJpbmcgY2Ruc19w
Y2llX2hvc3Rfc2V0dXAoKSwgdGhlDQo+dmFsdWUgb2YNCj4+IG1heF9saW5rX3NwZWVkIGlzIGV4
cGVjdGVkIHRvIGJlICcwJywgdW5sZXNzIHNwZWNpZmljYWxseSBpbml0aWFsaXplZCBieSB0aGUN
Cj5wbGF0Zm9ybSBjb2RlIHNlcGFyYXRlbHkuDQo+Pg0KPj4gV2hhdCBoYXBwZW5zIGlmIHRoZSBt
YXhfbGlua19zcGVlZCBpcyBub3QgZGVmaW5lZCBpbiB0aGUgY29ycmVzcG9uZGluZyBkdHMNCj4/
IFdvdWxkIG5vdCB0aGUgLUVJTlZBTCByZXR1cm5lZCBmcm9tIHRoZSBmdW5jdGlvbiBjcmVhdGUg
aXNzdWVzID8NCj4NCj5IaSBNYW5pa2FuZGFuLA0KPg0KPlBsZWFzZSBzZWU6DQo+DQo+aHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9i
bG9iL3Y3LjEtDQo+cmM0L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtDQo+ZGVzaWdu
d2FyZS5jKkwxOTFfXztJdyEhRUhzY21TMXlnaVUxbEEhRURIVmFrRDNRTjBnR3phM1YxX19xekhn
REc5DQo+UlpscTdMekM1QUZzWUxWMmk1RmNvdmVORnNqV09SUmdSZEhDQW1PSS1MaXpZNWNKdkdJ
V0JPRkpHJA0KPg0KPg0KPkJlc3QgcmVnYXJkcywNCj5IYW5zDQo+DQpUaGF0IGlzIGhvdyBEZXNp
Z253YXJlIGhhcyBpbXBsZW1lbnRlZCBpdCBidXQgdGhhdCBkb2VzIG5vdCBhbnN3ZXIgbXkgcXVl
cnkuIEJlY29zIGJvdGggdGhlc2UgaW1wbGVtZW50YXRpb25zIGRvIA0Kbm90IHRha2UgY2FyZSBv
ZiB0aGUgZXJyb3IgcmV0dXJuZWQsIGFuZCBpdCBjb3VsZCB3ZWxsIGJlIHRoZSBjYXNlIGZvciBt
YW55IG9mIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9ucy4NCg0KPj4NCj4+PiAJcGNpZS0+cmVn
X2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsDQo+Pj4g
InJlZyIpOw0KPj4+IAlpZiAoSVNfRVJSKHBjaWUtPnJlZ19iYXNlKSkgew0KPj4+IAkJZGV2X2Vy
cihkZXYsICJtaXNzaW5nIFwicmVnXCJcbiIpOw0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2NhZGVuY2UvcGNpZS1jYWRlbmNlLmgNCj4+PiBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvY2FkZW5jZS9wY2llLWNhZGVuY2UuaA0KPj4+IGluZGV4IDU3NGU5Y2Y0ZDAwMy4u
MDQyYTRjNDliYjlhIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2Fk
ZW5jZS9wY2llLWNhZGVuY2UuaA0KPj4+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2Fk
ZW5jZS9wY2llLWNhZGVuY2UuaA0KPj4+IEBAIC04Niw2ICs4Niw3IEBAIHN0cnVjdCBjZG5zX3Bs
YXRfcGNpZV9vZl9kYXRhIHsNCj4+PiAgICogQG9wczogUGxhdGZvcm0tc3BlY2lmaWMgb3BzIHRv
IGNvbnRyb2wgdmFyaW91cyBpbnB1dHMgZnJvbSBDYWRlbmNlIFBDSWUNCj4+PiAgICogICAgICAg
d3JhcHBlcg0KPj4+ICAgKiBAY2Ruc19wY2llX3JlZ19vZmZzZXRzOiBSZWdpc3RlciBiYW5rIG9m
ZnNldHMgZm9yIGRpZmZlcmVudCBTb0MNCj4+PiArICogQG1heF9saW5rX3NwZWVkOiBNYXhpbXVt
IHN1cHBvcnRlZCBsaW5rIHNwZWVkDQo+Pj4gICAqLw0KPj4+IHN0cnVjdCBjZG5zX3BjaWUgew0K
Pj4+IAl2b2lkIF9faW9tZW0JCSAgICAgICAgICAgICAqcmVnX2Jhc2U7DQo+Pj4gQEAgLTk4LDYg
Kzk5LDcgQEAgc3RydWN0IGNkbnNfcGNpZSB7DQo+Pj4gCXN0cnVjdCBkZXZpY2VfbGluawkgICAg
ICAgICAgICAgKipsaW5rOw0KPj4+IAljb25zdCAgc3RydWN0IGNkbnNfcGNpZV9vcHMgICAgICAg
ICAgKm9wczsNCj4+PiAJY29uc3QgIHN0cnVjdCBjZG5zX3BsYXRfcGNpZV9vZl9kYXRhICpjZG5z
X3BjaWVfcmVnX29mZnNldHM7DQo+Pj4gKwlpbnQJCQkJICAgICBtYXhfbGlua19zcGVlZDsNCj4+
PiB9Ow0KPj4+DQo+Pj4gLyoqDQo+Pj4gLS0NCj4+PiAyLjQzLjANCg0K

