Return-Path: <linux-renesas-soc+bounces-15563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFBA80824
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 14:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E46E1B87797
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4873726E14C;
	Tue,  8 Apr 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eZsPr789"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E91268FDE;
	Tue,  8 Apr 2025 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115638; cv=fail; b=MfOnUbYW29F2syM2pO7mToEdU7ncjg2CQE65NtxhKEWRbpFD8IFe1kmudchPmGH1QI3g2rxbo5jzgiIxqwcAXKYnSs5wlcDnBvKZUXSurwOkM0iGG6ri/h30nIL45tU/my7TFWuC4TMRRMjm4dP9fAb51OZCtAZRQ/iNFocXIqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115638; c=relaxed/simple;
	bh=+iW4A7e1uxT51lMk8rS5K252ocKvASnTdMgEboNL7iM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uPvzs03fGQnOYU92cnkE6rqeQh4ZwqXkAv5HG+hP+1oa97dY81K2AoTbKumrhutRXaYbXha1MIZTJlxVLVkVuK0g91Ym18JjrvefYQdIOUfsUMTeZFfHs9hm9QcqsX7iR9x0ytvtcf1QXNtvCGUT3x4j4fnz+Dc6TJSqQue1bQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eZsPr789; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Quio5OBp9OHzdlkpEEvcqXDkPTyQzsZ+Kbjh8Z3VxETdg1SFPe8tXaHx8LVVGV+dnzuZQCz6QCKrUJKu7PjnCpeqoyCXJLAoyZoEaxXz/I1J+2qp6ESbtqfEADDW4hb1MJh0AXL4bAO5NXFU4NISXs8IPySLDgBEAkY1rqED7QnS6pskusOMXRqzE7NB+aht1jYNCnTdtulDO9vv+beZKHKoemwqCFqpGE0Hz7O8YdBgfaTKSo7k0pxgrN2Sx1M3JOwRwWDZjZOXwBduGhzqywAM9IkbsCm7pEjCbf/N5uB+gf3KLnoBuqhaikcElblOyvbBIl2bGFtLks0MP5FuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iW4A7e1uxT51lMk8rS5K252ocKvASnTdMgEboNL7iM=;
 b=UeWdnlNUas2/M+y2Vs9uCjJYw7x8KDtZG0ddQNLVA5gaZStFsVCHzJBmMs/zdWzEmG8/mFUCY4ylDkFvd1hjrEEW4dnJGH1kd0TyipT4+Ti5CYJzj/8xT4V2HQ3vSsZTsSedw0kf8gOOpaQRC/pIvC8dfVNkx8DRhMO4nVHjW/kj8SGsZ/x6fEe2EtzZmvuS0XQpl1Je7oAIho1M8k4VeyP0+oz86RW7dsGlgaQlyBrrSsImrz2ePq4bDNaC4HakrSRb077Xfgjp8XtCgJqmj/Ecq2VSSuhMR9uYF/2Fvo16lfTidKilWHkaZKgddZRZrJpsgcyTHffTEqLkwcmkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iW4A7e1uxT51lMk8rS5K252ocKvASnTdMgEboNL7iM=;
 b=eZsPr789dyBlZMdKZ5w9SxEeIO0aeJGt4NEPpZW+xoy06rrMTmqH7I2/lUrjDBD3Cs3+t/55xSKHhrhly/CyqBbJr1x6kSvfZHtsUhRSENwpdlbBIkdVqElrG1HAS9O/6iV1FakklPH8zG37FHCCgk/RXZAtok3sJxplJktpKGw=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS0PR01MB5460.jpnprd01.prod.outlook.com (2603:1096:604:a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Tue, 8 Apr
 2025 12:33:47 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 12:33:47 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Topic: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Index: AQHbp6raLCyMPN3kxkGUjRK8DG3KN7OZk3vAgAAHlICAABlR4A==
Date: Tue, 8 Apr 2025 12:33:47 +0000
Message-ID:
 <TYCPR01MB1104042E21B4665D50C42F122D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CA+V-a8sWSOtgpbQT7+LEB8_WoEYyd4P6WDJn-DUQuOUA_ZP7xw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8sWSOtgpbQT7+LEB8_WoEYyd4P6WDJn-DUQuOUA_ZP7xw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS0PR01MB5460:EE_
x-ms-office365-filtering-correlation-id: c19c4f81-2ce8-40c9-ead0-08dd76999bd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QXJZQnlLUmp3UW1PS25zbG4wS1cram9CajBndUUzWmg2N0hPK3htVU1BSU1M?=
 =?utf-8?B?b2ZjdnQ1UTBEdkR3THNEUHU1THd2dWM1SlNaTXFYMU13NVowdTdoekpwY2tw?=
 =?utf-8?B?S2NjYWdRbGtJZUR6ajlYNitqOEdCbWYvS0xkdGd1MVdiSEhmbldXa3JDY0VU?=
 =?utf-8?B?czNEQTVpMWFndHlCRVU4ZWJZQzIwVFFycDZIYWFRaWhydTdjSGxmNWNvSmZV?=
 =?utf-8?B?b1p2Z01pNStKNGpPSFkyd1lJTjNFQldTZEd0WUluYzdqTnJXY29idnVycXRE?=
 =?utf-8?B?WGptNmdHS3ZWamoxNWZiRUMyRTNKay9vcFJNQ0QvZElodFN1U3A2eEZQU0hy?=
 =?utf-8?B?aTBrc2xtMUsvRTMzanI5M1RtQVhQUkQ1ZXR2WVhWeTY3VHd0ZnBTTjYwa3Rr?=
 =?utf-8?B?NWtqY3FpY3FFc2doa05XWEpQL2dUMnkySlJrZUJCa2N6WURaR2t3ZjBLSjVp?=
 =?utf-8?B?WHJzQnZiN3h3aUVmWk5hcUFQSDk4Q0NQZ1FiUWIweEdkYXQ1QTA2MWUvWnht?=
 =?utf-8?B?MkNDaERJbzBSaHFVVlZFUExQbU5RRlZuSTNpc0JoUHJGdVRScXpyZGgwWU04?=
 =?utf-8?B?dm4rd2Y3dmF1ZXBNNWNvOVd2QmlMZFk0TEpncHhucW1WVmtSL2NvMGtaLzJN?=
 =?utf-8?B?QjhBaGd5Q3lrOFFrWU82MWhjNVhsTEJnQ1JQVVJrWUo5cGhXdmFNamxvRUlW?=
 =?utf-8?B?RVFZbGlyb0xmUGtOMkwySDJDOU1wdGF0RW9lYzY3SUdHSUhDN0VJVk0xL0Vx?=
 =?utf-8?B?Zi9LMzIxQUtKQkl3V1cyMVR5YkYxeXlIRnZSY1N0U25GWHdQNFFpVUZ4SHJO?=
 =?utf-8?B?NHljWTdWUUpVS2t4alFGS2FlVzJ4bDZzL1RpZms1UzQwREt2M1JtWm5ON0tn?=
 =?utf-8?B?R3pZc29kWHE5d3lIanhwUzlmZnh2dkQ0TlNFUnRBeXphRkRpc2RqZDBVSHVJ?=
 =?utf-8?B?cjNiTHNMRlFaMWEwdnhnN3ZXZ2xnY1RONTI3M3oweTFDQ1dDRzFuaXI5allF?=
 =?utf-8?B?S1JlVkJHR2FYVGtEdnpaNFNrV0E2OEtxdFIrN3VObDIyM0ttT2hqZ005RU82?=
 =?utf-8?B?YWlPa0pITmE1SVdOcmFQNHdMNWUrUTMzbWNtRk1KdzZ5aUNROU9EKzBmdDdQ?=
 =?utf-8?B?cXhmb0gxdDFUUzhUQXJtTGkzTmlpanNsSlhmRzFOUmIyMlpEMk4ybm50d1Zv?=
 =?utf-8?B?TTdYd1ptK2g3MlRRYk1lUEY3aXNncU9HTkVRYXlUamQ2c0xzbnNtb3hIVXBv?=
 =?utf-8?B?TUE0YWNnSlpMaS9pZnYvdVUyUE1OMmJ6L0pSOENjbEFWOVUyVWN0eFRNTTZX?=
 =?utf-8?B?RVlIZzc5NGlaTjAxWmxDRVRGR293eE1kR294VXprcTY3MGJDdEVweE5yZk43?=
 =?utf-8?B?dVNvcEtjVEg5M0xnc2t0ZXg1RElPajM5akw3bFlLTHQzQ2EyaURRSkJ2Yng5?=
 =?utf-8?B?a1g3bVBxM1l2Zy9aKysrVkhKWVNncktrck9ZdGJsSWNLSzFFV2NaSWViK29W?=
 =?utf-8?B?Wm1uMW5OdmRyVG0zNkRCazRDWHN0THRjWDRURG5PaldNdnJ4aExVdUxydlhv?=
 =?utf-8?B?azhZVmVhVUpUU21TYVFVbE1vT2JIRlhRNk4yaEd4VUE3U0pLRG10Y3p3ZW4z?=
 =?utf-8?B?OElBNi9BRFpYWmJpbzVhTTg0Nzh4NUJvTlZyT1RES0NBMlNQbWhCRUVKOXJX?=
 =?utf-8?B?Wnc5QmF2QzRDOElZbG9vWEEvSGtKbW9tTU1EKzdLT0ttVDYybklZR2p5Wlcw?=
 =?utf-8?B?Z2ovSVdLWCtiUFFQNDgyS25YTTluaTN6d0t0WE9OZlk0OFBZbmhZVHh0OHBo?=
 =?utf-8?B?anIrV0xKWFhJc0ZDbFRmam9vU21Bdmk5OVRxRTk5ajR6Ylh0N1RlZGtoVFB0?=
 =?utf-8?B?VWJneEVSTTVpV1hDM2IyUVMweGxUNUFyczQ0MjNEc1J5MWJZTXlWMU1MZW9X?=
 =?utf-8?Q?sespQh1vV5EGfm9qzT3WtAIaZH9F5eEm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekxkNXZqKzc2UTd4TVZkOEZpZVRIdU1hdUszS2JsZnpxUWVsNlI3VDREK2Vv?=
 =?utf-8?B?cUxHQU9DRjdxVmhSUEtaemJhNE9zWEwyajB6eWllQ2krVHlQMlVMZWZ1T1Ur?=
 =?utf-8?B?NEE4Q1VSUG9mTHluYSt3UnFpUDZvcm5PZ1pXNUJySVpiOGxXSkxDREt2L0xB?=
 =?utf-8?B?WGhxMENvYWVzWFFYY2RPa2VsYXlWd3FFV2tXQmwzWTVjNXJTWThVZFY0OU4y?=
 =?utf-8?B?alIyRGZyUjlIeGgxYVhwN0dlbCs4dmxyUUloT3gwTlhmdXRtS3JxT3FJWFRG?=
 =?utf-8?B?dlRzM09lNVFSc1hKZlgyM05xOTdGcjlmYzZmaS9JRGthRnh1TTNYemFiMzJX?=
 =?utf-8?B?WU44ZmhqZ3NIUEN4dWl5ZUJyWEE1eEdhZXI4Qm5UMUxuMkI5Z1llVFdVa1kv?=
 =?utf-8?B?alM3aHd6cW81RVIrUDhzMitXbjBMYm1nV1UwQWxIM0xHL2VFM0VsU3JkbWJo?=
 =?utf-8?B?cTduME8waGFQQkcyK3daVGVzaVUzaUF6UW4zZFJOelNTRjhkWTdmOVRHRlJj?=
 =?utf-8?B?TTNxVFdESWdTakdWRFVvUWJkNVVOazFheHdHTzBnNHJVcXNZVzY3SHdRNzFT?=
 =?utf-8?B?RTh6Y0tjaytpYVBUckRkVldJVFpTSjRNeEpYQTNzQUVHZVdLZmd3U2xWY2F1?=
 =?utf-8?B?OXJVV3BJUENKNk0wZGF6azltVS92dTBKcXUybXZQZlRsZlJsNGE2eng5c0tV?=
 =?utf-8?B?ZG41TFVDU1dibXJXZzhLRzYxQ2xYcWE0VGZpMjV2MDJhUzQ2VllYWGRpNjZx?=
 =?utf-8?B?d1BVeURWUHRJY3prWTNvdTdlSnAyNjhrUXNFblh1VkJGWnYxTVVlU1hCL2Jr?=
 =?utf-8?B?cXEyRU9xQ3VGT0tLUFlUdk12cUNYMDE5VEtxSEwwUkZZdVprdC9PNi9RdXc4?=
 =?utf-8?B?K3Jzc01Zd0NzN3E1RGR4S0k3NTlqT3lnYjRvTFE4U2M0Tk5EWWtBUFdFL0x5?=
 =?utf-8?B?aVRkQ0xmVUdKdFpBdUxPeC9QM1V3YXdRbGJ5L3BNakNkZWNrOW5hV2JTejBj?=
 =?utf-8?B?RFkwdnNYcElZbkoxRDY3Wm9yT1gxRWc5OElOYTNQbmZMZ2JhcmZnWWVMRCt2?=
 =?utf-8?B?WDVLQitxM0ZXZGZvd005T2c2R1ozL2FTN3dkR2p6OUhNOWFwakZReThvT0F3?=
 =?utf-8?B?YjJoMzdUK0Z3Ylp1bXJUOHFsWi9RSXpNYW1uNlc2TFAvS3NlZENjK3g4TE5p?=
 =?utf-8?B?N1c3MWsrelFwTk1TTlo4ZFZsa2lEYnd0RElXMmtUU3VmcUNLUVpqWnlJRVdp?=
 =?utf-8?B?RThCYTQwdHRZWGNtQUZBcGNhRTRBbDhDZ2IrcDIzVldjcm9RZzlmVWFxeWFr?=
 =?utf-8?B?N2s3YmFIUDNGanUzYkIvdEdocmt5VmVJZ1VUUXF1Wk1xMkRmUDJKYXF0aEZI?=
 =?utf-8?B?cnFGdkhlRGtwSnhTcHdFSHgySXZwVzB5b0U0a1pWRC8rZlBTaHNTcDRRazBs?=
 =?utf-8?B?RWswSkVUWjhLL084dExFZ0Y5aUJoWlRvSk9zLy9pY1luVmhXcmowZ1M1NWlL?=
 =?utf-8?B?YmJVSW1YNVhuQ0JPSUdRNHFHQkt5SVZ3S3kyT0NVeDdwcWEreXNXUy81dExE?=
 =?utf-8?B?blRjTFNJVncrRzJneFRxVFpYd3FSaEY0MG15bWVlR1Z5VGZqMEtyWDdaRXZy?=
 =?utf-8?B?QUtlZXJkUDhucCt1bVRMdmpLbWJPOXZ3b2JjeldQVFd6eWlJUHg3QWV2b3Bv?=
 =?utf-8?B?VS85cHdqVEUwZGpVN1hGcUVyZzNFOXhraUFpUU1abFFpalBvZmZjQ21mMndQ?=
 =?utf-8?B?SHBseHMray80eHdSSXlHYzhQeUxvV0ZFOHJlNjFORDFQQUZjbVR3SGJkam1G?=
 =?utf-8?B?YzRWWU5oVUhBYm5Tek5rK093RFVEZXBDUlYrTlpRdGpBclJnSCs1b0t2ei9r?=
 =?utf-8?B?VktvWExtcWJiT2xzNXYzbjN0NEFqeFBYR1E3a0NjYWRpcXBWaXREZkxSTUdk?=
 =?utf-8?B?czJidEprNktybjJuUkJZRGdoR01TdjRsNG1EYU92SnRLOGI1Ly9xUGRBR3V1?=
 =?utf-8?B?alVnZHJJZGUyNjFMTjJFUUxXU3VmK21iLzc5R2tBNmVnZXY0bnFKTzgxdFNV?=
 =?utf-8?B?K3lFT29rWDFlTVRmbE0vMDFaQVpMYVN5TlRYU2p4UjRWc1Z5ZS8wMCsyWUFy?=
 =?utf-8?B?YzFDMmRYV2F4cE5odmhKSCtBTnNwNXNiOG5lSEtPL3NIMDZaNVg4T1ZFNXJZ?=
 =?utf-8?B?V0kvSG5hRTJ2eUptOFlvQ0R3bndMaXc3Rnd3QUhTNmVCSFN4anFhbDZXdjN4?=
 =?utf-8?B?ZUVlZHhlbGNNdURUdmlYS1lDQndnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19c4f81-2ce8-40c9-ead0-08dd76999bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 12:33:47.2636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NekLBhjnlpvfypQrkoyY3Y5lq3UX3ti5ZdR9Eb86whOBTwGqXs9j83DlyUSKO4LF2HxpDMUtkbIaomB/EYxtMU8myGySTTSYlCo3Bito/oQkSQb6+LeC5lRt/5eJGQ8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5460

SGVsbG8gUHJhYmhha2FyLXNhbiwNCg0KPiBGcm9tOiBMYWQsIFByYWJoYWthciwgU2VudDogVHVl
c2RheSwgQXByaWwgOCwgMjAyNSA3OjU5IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+
IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4gDQo+IE9uIFR1ZSwgQXByIDgsIDIwMjUgYXQg
MTE6NDDigK9BTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGVsbG8gUHJhYmhha2FyLXNhbiwNCj4gPg0KPiA+
IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoIQ0KPiA+DQo+ID4gPiBGcm9tOiBQcmFiaGFrYXIsIFNl
bnQ6IE1vbmRheSwgQXByaWwgNywgMjAyNSA3OjUwIFBNDQo+ID4gPg0KPiA+ID4gUmVvcmRlciB0
aGUgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UgaW4gYHVzYmhzX3Byb2JlKClgIHRvIGVuYWJsZSBy
dW50aW1lDQo+ID4gPiBQTSBiZWZvcmUgYWNjZXNzaW5nIHJlZ2lzdGVycywgcHJldmVudGluZyBw
b3RlbnRpYWwgY3Jhc2hlcyBkdWUgdG8NCj4gPiA+IHVuaW5pdGlhbGl6ZWQgY2xvY2tzLg0KPiA+
DQo+ID4gSnVzdCBmb3IgYSByZWNvcmQuIEkgZG9uJ3Qga25vdyB3aHksIGJ1dCB0aGUgaXNzdWUg
ZGlkbid0IG9jY3VyIG9uIHRoZSBvcmlnaW5hbCBjb2RlDQo+ID4gd2l0aCBteSBlbnZpcm9ubWVu
dCAoUi1DYXIgSDMpLiBCdXQsIGFueXdheSwgSSB1bmRlcnN0b29kIHRoYXQgd2UgbmVlZCB0aGlz
IHBhdGNoIGZvciBSWi9WMkguDQo+ID4NCj4gTG9va2luZyBhdCB0aGUgcjhhNzc5NTEuZHRzaSB3
ZSBoYXZlIHRoZSBiZWxvdzoNCj4gDQo+IGhzdXNiOiB1c2JAZTY1OTAwMDAgew0KPiAgICAgICAg
IGNvbXBhdGlibGUgPSAicmVuZXNhcyx1c2Jocy1yOGE3Nzk1IiwNCj4gICAgICAgICAuLi4NCj4g
ICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcwMz4sIDwmY3BnIENQR19NT0QgNzA0PjsN
Cj4gICAgICAgICAuLi4uDQo+IH07DQo+IA0KPiBUaGUgc2FtZSBjbG9ja3MgYXJlIHVzZWQgZm9y
IGVoY2kwL29oY2kwL3BoeTAgaW4gIHI4YTc3OTUxLmR0c2ksDQo+IHByb2JhYmx5IGJ5IHRoZSB0
aW1lIHdlIHJlYWNoIHByb2JpbmcgdGhlIHVzYmhzIGRyaXZlciB0aGVzZSBjbG9ja3MNCj4gbWF5
IGhhdmUgYmVlbiBhbHJlYWR5IGVuYWJsZWQgaGVuY2Ugd2UgbWlnaHQgbm90IHNlZSB0aGlzIGlz
c3VlLg0KDQpJIHNlZS4NCg0KPiA+IC0tLS0tIEkgYWRkZWQgc29tZSBkZWJ1ZyBwcmludGsgLS0t
LS0NCj4gPiA8c25pcD4NCj4gPiBbICAgIDMuMTkzNDAwXSB1c2Joc19wcm9iZTo3MDYNCj4gPiBb
ICAgIDMuMTk2MjA0XSB1c2Joc19wcm9iZTo3MTANCj4gPiBbICAgIDMuMTk5MDEyXSB1c2Joc19w
cm9iZTo3MTUNCj4gPiBbICAgIDMuMjAxODA4XSB1c2Joc19wcm9iZTo3MjANCj4gPiBbICAgIDMu
MjA0NjA1XSB1c2Joc19yZWFkOiByZWcgPSAwDQo+ID4gWyAgICAzLjIwNzc1NF0gdXNiaHNfd3Jp
dGU6IHJlZyA9IDAsIGRhdGEgPSAyMA0KPiA+IFsgICAgMy4yMTE5NDFdIHVzYmhzX3Byb2JlOjcy
Nw0KPiA+IFsgICAgMy4yMTQ3MzhdIHVzYmhzX3JlYWQ6IHJlZyA9IDEwMg0KPiA+IFsgICAgMy4y
MTgwNjFdIHVzYmhzX3dyaXRlOiByZWcgPSAxMDIsIGRhdGEgPSA0MDAwDQo+ID4gWyAgICAzLjIy
MjY5N10gdXNiaHNfcmVhZDogcmVnID0gMA0KPiA+IFsgICAgMy4yMjU4NDVdIHVzYmhzX3dyaXRl
OiByZWcgPSAwLCBkYXRhID0gNDIwDQo+ID4gWyAgICAzLjIzMDExOF0gdXNiaHNfd3JpdGU6IHJl
ZyA9IDMwLCBkYXRhID0gMA0KPiA+IFsgICAgMy4yMzQzMDRdIHVzYmhzX3dyaXRlOiByZWcgPSAz
MiwgZGF0YSA9IDANCj4gPiBbICAgIDMuMjM4NDg5XSB1c2Joc193cml0ZTogcmVnID0gM2EsIGRh
dGEgPSAwDQo+ID4gWyAgICAzLjI0MjY3M10gdXNiaHNfd3JpdGU6IHJlZyA9IDM2LCBkYXRhID0g
MA0KPiA+IFsgICAgMy4yNDY4NTldIHVzYmhzX3dyaXRlOiByZWcgPSAzMCwgZGF0YSA9IDgwMDAN
Cj4gPiBbICAgIDMuMjUxMzEyXSB1c2Joc19yZWFkOiByZWcgPSA0MA0KPiA+IFsgICAgMy4yNTQ1
NDBdIHJlbmVzYXNfdXNiaHMgZTY1OWMwMDAudXNiOiBwcm9iZWQNCj4gPiBbICAgIDMuODAyMDEw
XSB1c2Joc19wcm9iZTo2OTANCj4gPiBbICAgIDMuODA4Njc3XSByZW5lc2FzLWNwZy1tc3NyIGU2
MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IE1TVFAgNzA0L2hzdXNiIE9ODQo+ID4gLS0tLS0NCj4g
Pg0KPiA+ID4gQ3VycmVudGx5LCBpbiB0aGUgcHJvYmUgcGF0aCwgcmVnaXN0ZXJzIGFyZSBhY2Nl
c3NlZCBiZWZvcmUgZW5hYmxpbmcgdGhlDQo+ID4gPiBjbG9ja3MsIGxlYWRpbmcgdG8gYSBzeW5j
aHJvbm91cyBleHRlcm5hbCBhYm9ydCBvbiB0aGUgUlovVjJIIFNvQy4NCj4gPiA+IFRoZSBwcm9i
bGVtYXRpYyBjYWxsIGZsb3cgaXMgYXMgZm9sbG93czoNCj4gPiA+DQo+ID4gPiAgICAgdXNiaHNf
cHJvYmUoKQ0KPiA+ID4gICAgICAgICB1c2Joc19zeXNfY2xvY2tfY3RybCgpDQo+ID4gPiAgICAg
ICAgICAgICB1c2Joc19ic2V0KCkNCj4gPiA+ICAgICAgICAgICAgICAgICB1c2Joc193cml0ZSgp
DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgIGlvd3JpdGUxNigpICA8LS0gUmVnaXN0ZXIgYWNj
ZXNzIGJlZm9yZSBlbmFibGluZyBjbG9ja3MNCj4gPiA+DQo+ID4gPiBTaW5jZSBgaW93cml0ZTE2
KClgIGlzIHBlcmZvcm1lZCB3aXRob3V0IGVuc3VyaW5nIHRoZSByZXF1aXJlZCBjbG9ja3MgYXJl
DQo+ID4gPiBlbmFibGVkLCB0aGlzIGNhbiBsZWFkIHRvIGFjY2VzcyBlcnJvcnMuIFRvIGZpeCB0
aGlzLCBlbmFibGUgUE0gcnVudGltZQ0KPiA+ID4gZWFybHkgaW4gdGhlIHByb2JlIGZ1bmN0aW9u
IGFuZCBlbnN1cmUgY2xvY2tzIGFyZSBhY3F1aXJlZCBiZWZvcmUgcmVnaXN0ZXINCj4gPiA+IGFj
Y2VzcywgcHJldmVudGluZyBjcmFzaGVzIGxpa2UgdGhlIGZvbGxvd2luZyBvbiBSWi9WMkg6DQo+
ID4gPg0KPiA+ID4gWzEzLjI3MjY0MF0gSW50ZXJuYWwgZXJyb3I6IHN5bmNocm9ub3VzIGV4dGVy
bmFsIGFib3J0OiAwMDAwMDAwMDk2MDAwMDEwIFsjMV0gUFJFRU1QVCBTTVANCj4gPiA+IFsxMy4y
ODA4MTRdIE1vZHVsZXMgbGlua2VkIGluOiBjZWMgcmVuZXNhc191c2JocygrKSBkcm1fa21zX2hl
bHBlciBmdXNlIGRybSBiYWNrbGlnaHQgaXB2Ng0KPiA+ID4gWzEzLjI4OTA4OF0gQ1BVOiAxIFVJ
RDogMCBQSUQ6IDE5NSBDb21tOiAodWRldi13b3JrZXIpIE5vdCB0YWludGVkIDYuMTQuMC1yYzcr
ICM5OA0KPiA+ID4gWzEzLjI5NjY0MF0gSGFyZHdhcmUgbmFtZTogUmVuZXNhcyBSWi9WMkggRVZL
IEJvYXJkIGJhc2VkIG9uIHI5YTA5ZzA1N2g0NCAoRFQpDQo+ID4gPiBbMTMuMzAzODM0XSBwc3Rh
dGU6IDYwNDAwMDA1IChuWkN2IGRhaWYgK1BBTiAtVUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0t
LSkNCj4gPiA+IFsxMy4zMTA3NzBdIHBjIDogdXNiaHNfYnNldCsweDE0LzB4NGMgW3JlbmVzYXNf
dXNiaHNdDQo+ID4gPiBbMTMuMzE1ODMxXSBsciA6IHVzYmhzX3Byb2JlKzB4MmU0LzB4NWFjIFty
ZW5lc2FzX3VzYmhzXQ0KPiA+ID4gWzEzLjMyMTEzOF0gc3AgOiBmZmZmODAwMDgyN2UzODUwDQo+
ID4gPiBbMTMuMzI0NDM4XSB4Mjk6IGZmZmY4MDAwODI3ZTM4NjAgeDI4OiAwMDAwMDAwMDAwMDAw
MDAwIHgyNzogZmZmZjgwMDA4MjdlM2NhMA0KPiA+ID4gWzEzLjMzMTU1NF0geDI2OiBmZmZmODAw
MDgyN2UzYmEwIHgyNTogZmZmZjgwMDA4MTcyOTY2OCB4MjQ6IDAwMDAwMDAwMDAwMDAwMjUNCj4g
PiA+IFsxMy4zMzg2NzBdIHgyMzogZmZmZjAwMDBjMGYwODAwMCB4MjI6IDAwMDAwMDAwMDAwMDAw
MDAgeDIxOiBmZmZmMDAwMGMwZjA4MDEwDQo+ID4gPiBbMTMuMzQ1NzgzXSB4MjA6IDAwMDAwMDAw
MDAwMDAwMDAgeDE5OiBmZmZmMDAwMGMzYjUyMDgwIHgxODogMDAwMDAwMDBmZmZmZmZmZg0KPiA+
ID4gWzEzLjM1Mjg5NV0geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDAwMDAwMDAw
MCB4MTU6IGZmZmY4MDAwODI3ZTM2Y2UNCj4gPiA+IFsxMy4zNjAwMDldIHgxNDogMDAwMDAwMDAw
MDAwMDNkNyB4MTM6IDAwMDAwMDAwMDAwMDAzZDcgeDEyOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4g
PiBbMTMuMzY3MTIyXSB4MTE6IDAwMDAwMDAwMDAwMDAwMDAgeDEwOiAwMDAwMDAwMDAwMDAwYWEw
IHg5IDogZmZmZjgwMDA4MjdlMzc1MA0KPiA+ID4gWzEzLjM3NDIzNV0geDggOiBmZmZmMDAwMGMx
ODUwYjAwIHg3IDogMDAwMDAwMDAwMzgyNjA2MCB4NiA6IDAwMDAwMDAwMDAwMDAwMWMNCj4gPiA+
IFsxMy4zODEzNDddIHg1IDogMDAwMDAwMDMwZDVmY2MwMCB4NCA6IGZmZmY4MDAwODI1YzAwMDAg
eDMgOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiBbMTMuMzg4NDU5XSB4MiA6IDAwMDAwMDAwMDAw
MDA0MDAgeDEgOiAwMDAwMDAwMDAwMDAwMDAwIHgwIDogZmZmZjAwMDBjM2I1MjA4MA0KPiA+ID4g
WzEzLjM5NTU3NF0gQ2FsbCB0cmFjZToNCj4gPiA+IFsxMy4zOTgwMTNdICB1c2Joc19ic2V0KzB4
MTQvMHg0YyBbcmVuZXNhc191c2Joc10gKFApDQo+ID4gPiBbMTMuNDAzMDc2XSAgcGxhdGZvcm1f
cHJvYmUrMHg2OC8weGRjDQo+ID4gPiBbMTMuNDA2NzM4XSAgcmVhbGx5X3Byb2JlKzB4YmMvMHgy
YzANCj4gPiA+IFsxMy40MTAzMDZdICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg3OC8weDEyMA0K
PiA+ID4gWzEzLjQxNDY1M10gIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHgzYy8weDE1NA0KPiA+ID4g
WzEzLjQxODgyNV0gIF9fZHJpdmVyX2F0dGFjaCsweDkwLzB4MWEwDQo+ID4gPiBbMTMuNDIyNjQ3
XSAgYnVzX2Zvcl9lYWNoX2RldisweDdjLzB4ZTANCj4gPiA+IFsxMy40MjY0NzBdICBkcml2ZXJf
YXR0YWNoKzB4MjQvMHgzMA0KPiA+ID4gWzEzLjQzMDAzMl0gIGJ1c19hZGRfZHJpdmVyKzB4ZTQv
MHgyMDgNCj4gPiA+IFsxMy40MzM3NjZdICBkcml2ZXJfcmVnaXN0ZXIrMHg2OC8weDEzMA0KPiA+
ID4gWzEzLjQzNzU4N10gIF9fcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKzB4MjQvMHgzMA0KPiA+
ID4gWzEzLjQ0MjI3M10gIHJlbmVzYXNfdXNiaHNfZHJpdmVyX2luaXQrMHgyMC8weDEwMDAgW3Jl
bmVzYXNfdXNiaHNdDQo+ID4gPiBbMTMuNDQ4NDUwXSAgZG9fb25lX2luaXRjYWxsKzB4NjAvMHgx
ZDQNCj4gPiA+IFsxMy40NTIyNzZdICBkb19pbml0X21vZHVsZSsweDU0LzB4MWY4DQo+ID4gPiBb
MTMuNDU2MDE0XSAgbG9hZF9tb2R1bGUrMHgxNzU0LzB4MWM5OA0KPiA+ID4gWzEzLjQ1OTc1MF0g
IGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDg4LzB4Y2MNCj4gPiA+IFsxMy40NjQwMDRdICBfX2Fy
bTY0X3N5c19maW5pdF9tb2R1bGUrMHgxYzQvMHgzMjgNCj4gPiA+IFsxMy40Njg2ODldICBpbnZv
a2Vfc3lzY2FsbCsweDQ4LzB4MTA0DQo+ID4gPiBbMTMuNDcyNDI2XSAgZWwwX3N2Y19jb21tb24u
Y29uc3Rwcm9wLjArMHhjMC8weGUwDQo+ID4gPiBbMTMuNDc3MTEzXSAgZG9fZWwwX3N2YysweDFj
LzB4MjgNCj4gPiA+IFsxMy40ODA0MTVdICBlbDBfc3ZjKzB4MzAvMHhjYw0KPiA+ID4gWzEzLjQ4
MzQ2MF0gIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MTBjLzB4MTM4DQo+ID4gPiBbMTMuNDg3ODAw
XSAgZWwwdF82NF9zeW5jKzB4MTk4LzB4MTljDQo+ID4gPiBbMTMuNDkxNDUzXSBDb2RlOiAyYTAx
MDNlMSAxMjAwM2M0MiAxMjAwM2M2MyA4YjAxMDA4NCAoNzk0MDAwODQpDQo+ID4gPiBbMTMuNDk3
NTIyXSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gPiA+DQo+ID4gPiBG
aXhlczogZjE0MDdkNWM2NjI0MCAoInVzYjogcmVuZXNhc191c2JoczogQWRkIFJlbmVzYXMgVVNC
SFMgY29tbW9uIGNvZGUiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAg
ZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYyB8IDUwICsrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvcmVu
ZXNhc191c2Jocy9jb21tb24uYyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMN
Cj4gPiA+IGluZGV4IDcwM2NmNWQwY2I0MS4uZjUyNDE4ZmUzZmQ0IDEwMDY0NA0KPiA+ID4gLS0t
IGEvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+ID4gKysrIGIvZHJpdmVy
cy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+ID4gQEAgLTY4NSwxMCArNjg1LDI5IEBA
IHN0YXRpYyBpbnQgdXNiaHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
PiA+ICAgICAgIElOSVRfREVMQVlFRF9XT1JLKCZwcml2LT5ub3RpZnlfaG90cGx1Z193b3JrLCB1
c2Joc2Nfbm90aWZ5X2hvdHBsdWcpOw0KPiA+ID4gICAgICAgc3Bpbl9sb2NrX2luaXQodXNiaHNf
cHJpdl90b19sb2NrKHByaXYpKTsNCj4gPiA+DQo+ID4gPiArICAgICAvKg0KPiA+ID4gKyAgICAg
ICogQWNxdWlyZSBjbG9ja3MgYW5kIGVuYWJsZSBwb3dlciBtYW5hZ2VtZW50IChQTSkgZWFybHkg
aW4gdGhlDQo+ID4gPiArICAgICAgKiBwcm9iZSBwcm9jZXNzLCBhcyB0aGUgZHJpdmVyIGFjY2Vz
c2VzIHJlZ2lzdGVycyBkdXJpbmcNCj4gPiA+ICsgICAgICAqIGluaXRpYWxpemF0aW9uLiBFbnN1
cmUgdGhlIGRldmljZSBpcyBhY3RpdmUgYmVmb3JlIHByb2NlZWRpbmcuDQo+ID4gPiArICAgICAg
Ki8NCj4gPiA+ICsgICAgIHBtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gPiArDQo+ID4gPiAr
ICAgICByZXQgPSB1c2Joc2NfY2xrX2dldChkZXYsIHByaXYpOw0KPiA+ID4gKyAgICAgaWYgKHJl
dCkNCj4gPiA+ICsgICAgICAgICAgICAgZ290byBwcm9iZV9wbV9kaXNhYmxlOw0KPiA+ID4gKw0K
PiA+ID4gKyAgICAgcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiA+ID4g
KyAgICAgaWYgKHJldCkNCj4gPiA+ICsgICAgICAgICAgICAgZ290byBwcm9iZV9jbGtfcHV0Ow0K
PiA+ID4gKw0KPiA+ID4gKyAgICAgcmV0ID0gdXNiaHNjX2Nsa19wcmVwYXJlX2VuYWJsZShwcml2
KTsNCj4gPiA+ICsgICAgIGlmIChyZXQpDQo+ID4gPiArICAgICAgICAgICAgIGdvdG8gcHJvYmVf
cG1fcHV0Ow0KPiA+ID4gKw0KPiA+DQo+ID4gRGlkIHlvdSByZWFsbHkgbmVlZCB0byBjYWxsIHRo
ZXNlIGZ1bmN0aW9ucyBhdCB0aGlzIHRpbWluZz8NCj4gPiBJSVVDLCB1c2Joc197cGlwZSxmaWZv
LG1vZH1fcHJvYmUoKSB3aWxsIG5vdCBhY2Nlc3MgYW55IHJlZ2lzdGVycy4NCj4gPg0KPiBBY3R1
YWxseSB0aGUgY29kZSBwYXRoIGRvZXMgYWNjZXNzIHRoZSByZWdpc3RlcnMsICB3aXRoDQo+IGBD
T05GSUdfVVNCX0dfU0VSSUFMPXlgIEkgZ2V0IHRoZSBiZWxvdyB3aXRob3V0IHRoaXMgcGF0Y2gu
DQoNCkkgZ290IGl0Lg0KDQpTbywgSSB0aGluayB0aGF0IHRoaXMgcGF0Y2ggc2VlbXMgZ29vZCBl
eGNlcHQgb25lIG5pdCB0aGluZy4NCkknbGwgc2VuZCBhIHJlcGx5IGFib3V0IHRoZSBuaXQgbGF0
ZXIuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gWzE0LjMxODYyNl0g
Z19zZXJpYWwgZ2FkZ2V0LjA6IGdfc2VyaWFsIHJlYWR5DQo+IFsxNC4zMjM5MjNdIEludGVybmFs
IGVycm9yOiBzeW5jaHJvbm91cyBleHRlcm5hbCBhYm9ydDoNCj4gMDAwMDAwMDA5NjAwMDAxMCBb
IzFdIFBSRUVNUFQgU01QDQo+IFsxNC4zMzIxMDddIE1vZHVsZXMgbGlua2VkIGluOiByemcybF9t
aXBpX2RzaSByY2FyX2ZjcA0KPiByZW5lc2FzX3VzYmhzKCspIGRybV9zaG1lbV9oZWxwZXIgZGlz
cGxheV9jb25uZWN0b3IgZ3B1X3NjaGVkDQo+IGRybV9rbXNfaGVscGVyIGZ1c2UgZHJtIGJhY2ts
aWdodCBpcHY2DQo+IFsxNC4zNDYwMjVdIENQVTogMSBVSUQ6IDAgUElEOiAxODcgQ29tbTogKHVk
ZXYtd29ya2VyKSBOb3QgdGFpbnRlZA0KPiA2LjE0LjAtcmM3KyAjOTkNCj4gWzE0LjM1MzU3OF0g
SGFyZHdhcmUgbmFtZTogUmVuZXNhcyBSWi9WMkggRVZLIEJvYXJkIGJhc2VkIG9uIHI5YTA5ZzA1
N2g0NCAoRFQpDQo+IFsxNC4zNjA3NzVdIHBzdGF0ZTogMjA0MDAwYzUgKG56Q3YgZGFJRiArUEFO
IC1VQU8gLVRDTyAtRElUIC1TU0JTIEJUWVBFPS0tKQ0KPiBbMTQuMzY3NzExXSBwYyA6IHVzYmhz
X3N5c19mdW5jdGlvbl9wdWxsdXArMHgxMC8weDQwIFtyZW5lc2FzX3VzYmhzXQ0KPiBbMTQuMzc0
MDgyXSBsciA6IHVzYmhzZ191cGRhdGVfcHVsbHVwKzB4NTgvMHg2OCBbcmVuZXNhc191c2Joc10N
Cj4gWzE0LjM3NDEwN10gc3AgOiBmZmZmODAwMDgyNzhiNDYwDQo+IFsxNC4zNzQxMTBdIHgyOTog
ZmZmZjgwMDA4Mjc4YjQ2MCB4Mjg6IGZmZmY4MDAwNzlhMzU1ZjAgeDI3OiAwMDAwMDAwMDAwMDAw
MDBhDQo+IFsxNC4zNzQxMjJdIHgyNjogZmZmZjgwMDA3OWEzNWQwMCB4MjU6IGZmZmYwMDAwYzNj
MjZiNDAgeDI0OiBmZmZmODAwMDgxN2JiMWMwDQo+IFsxNC4zNzQxMzFdIHgyMzogZmZmZjAwMDBj
MzNjZDgwMCB4MjI6IGZmZmYwMDAwYzIyMWU0ODAgeDIxOiBmZmZmMDAwMGMyMjFlNTQwDQo+IFsx
NC4zNzQxNDBdIHgyMDogMDAwMDAwMDAwMDAwMDAwMSB4MTk6IGZmZmYwMDAwYzIyMWU0ODAgeDE4
OiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsxNC4zNzQxNDhdIHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4
MTY6IDAwMDAwMDAwMDAwMDAwMDAgeDE1OiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsxNC4zNzQxNTZd
IHgxNDogMDAwMDAwMDAwMDAwMDA3NCB4MTM6IGZmZmYwMDAwYzMzYWM2ODAgeDEyOiAwMDAwMDAw
MDAwMDAwMDAwDQo+IFsxNC4zNzQxNjRdIHgxMTogZmZmZjAwMDBjMzNhYzY4MCB4MTA6IDAwMDAw
MDAwMDAwMDBhYTAgeDkgOiBmZmZmODAwMDgyNzhiMTYwDQo+IFsxNC4zNzQxNzJdIHg4IDogZmZm
ZjAwMDBjMzNhZDEwMCB4NyA6IDAwMDAwMDAwMDIzMDdhODMgeDYgOiAwMDAwMDAwMDAwMDAwMzJj
DQo+IFsxNC4zNzQxODBdIHg1IDogZmZmZjAwMDNmZGZiNDM4OCB4NCA6IDAwMDAwMDAwMDAwMDAw
MDAgeDMgOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsxNC4zNzQxODddIHgyIDogMDAwMDAwMDAwMDAw
MDAxMCB4MSA6IGZmZmY4MDAwODI1YTAwMDAgeDAgOiBmZmZmMDAwMGMyMjFlNDgwDQo+IFsxNC4z
NzQxOTddIENhbGwgdHJhY2U6DQo+IFsxNC4zNzQyMDBdICB1c2Joc19zeXNfZnVuY3Rpb25fcHVs
bHVwKzB4MTAvMHg0MCBbcmVuZXNhc191c2Joc10gKFApDQo+IFsxNC4zNzQyMjBdICB1c2Joc2df
cHVsbHVwKzB4NTQvMHg3OCBbcmVuZXNhc191c2Joc10NCj4gWzE0LjM3NDIzNl0gIHVzYl9nYWRn
ZXRfY29ubmVjdF9sb2NrZWQrMHg0NC8weDhjDQo+IFsxNC4zNzQyNDldICBnYWRnZXRfYmluZF9k
cml2ZXIrMHgxOTgvMHgyODQNCj4gWzE0LjM3NDI1Nl0gIHJlYWxseV9wcm9iZSsweGJjLzB4MmMw
DQo+IFsxNC4zNzQyNjZdICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHg3OC8weDEyMA0KPiBbMTQu
Mzc0MjcyXSAgZHJpdmVyX3Byb2JlX2RldmljZSsweDNjLzB4MTU0DQo+IFsxNC4zNzQyNzhdICBf
X2RldmljZV9hdHRhY2hfZHJpdmVyKzB4YjgvMHgxNDANCj4gWzE0LjM3NDI4NV0gIGJ1c19mb3Jf
ZWFjaF9kcnYrMHg4OC8weGU4DQo+IFsxNC4zNzQyOTJdICBfX2RldmljZV9hdHRhY2grMHhhMC8w
eDE5MA0KPiBbMTQuMzc0Mjk5XSAgZGV2aWNlX2luaXRpYWxfcHJvYmUrMHgxNC8weDIwDQo+IFsx
NC4zNzQzMDZdICBidXNfcHJvYmVfZGV2aWNlKzB4YjQvMHhjMA0KPiBbMTQuMzc0MzEyXSAgZGV2
aWNlX2FkZCsweDVjNC8weDdhMA0KPiBbMTQuMzc0MzE4XSAgdXNiX2FkZF9nYWRnZXQrMHgxOTgv
MHgyMjANCj4gWzE0LjM3NDMyNF0gIHVzYl9hZGRfZ2FkZ2V0X3VkYysweDY4LzB4YTANCj4gWzE0
LjM3NDMzMF0gIHVzYmhzX21vZF9nYWRnZXRfcHJvYmUrMHgyMTgvMHgyYzQgW3JlbmVzYXNfdXNi
aHNdDQo+IFsxNC4zNzQzNDddICB1c2Joc19tb2RfcHJvYmUrMHgzMC8weGMwIFtyZW5lc2FzX3Vz
YmhzXQ0KPiBbMTQuMzc0MzYzXSAgdXNiaHNfcHJvYmUrMHgyMDgvMHg1YTAgW3JlbmVzYXNfdXNi
aHNdDQo+IFsxNC4zNzQzNzhdICBwbGF0Zm9ybV9wcm9iZSsweDY4LzB4ZGMNCj4gWzE0LjM3NDM4
N10gIHJlYWxseV9wcm9iZSsweGJjLzB4MmMwDQo+IFsxNC4zNzQzOTRdICBfX2RyaXZlcl9wcm9i
ZV9kZXZpY2UrMHg3OC8weDEyMA0KPiBbMTQuMzc0NDAwXSAgZHJpdmVyX3Byb2JlX2RldmljZSsw
eDNjLzB4MTU0DQo+IFsxNC4zNzQ0MDddICBfX2RyaXZlcl9hdHRhY2grMHg5MC8weDFhMA0KPiBb
MTQuMzc0NDEzXSAgYnVzX2Zvcl9lYWNoX2RldisweDdjLzB4ZTANCj4gWzE0LjM3NDQxOV0gIGRy
aXZlcl9hdHRhY2grMHgyNC8weDMwDQo+IFsxNC4zNzQ0MjVdICBidXNfYWRkX2RyaXZlcisweGU0
LzB4MjA4DQo+IFsxNC4zNzQ0MzJdICBkcml2ZXJfcmVnaXN0ZXIrMHg2OC8weDEzMA0KPiBbMTQu
Mzc0NDM4XSAgX19wbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIrMHgyNC8weDMwDQo+IFsxNC4zNzQ0
NDZdICByZW5lc2FzX3VzYmhzX2RyaXZlcl9pbml0KzB4MjAvMHgxMDAwIFtyZW5lc2FzX3VzYmhz
XQ0KPiBbMTQuMzc0NDYyXSAgZG9fb25lX2luaXRjYWxsKzB4NjAvMHgxZDQNCj4gWzE0LjM3NDQ3
NF0gIGRvX2luaXRfbW9kdWxlKzB4NTQvMHgxZjgNCj4gWzE0LjM3NDQ4NF0gIGxvYWRfbW9kdWxl
KzB4MTc1NC8weDFjOTgNCj4gWzE0LjM3NDQ5Ml0gIGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDg4
LzB4Y2MNCj4gWzE0LjM3NDQ5OV0gIF9fYXJtNjRfc3lzX2Zpbml0X21vZHVsZSsweDFjNC8weDMy
OA0KPiBbMTQuMzc0NTA2XSAgaW52b2tlX3N5c2NhbGwrMHg0OC8weDEwNA0KPiBbMTQuMzc0NTE2
XSAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHhjMC8weGUwDQo+IFsxNC4zNzQ1MjRdICBk
b19lbDBfc3ZjKzB4MWMvMHgyOA0KPiBbMTQuMzc0NTMwXSAgZWwwX3N2YysweDMwLzB4Y2MNCj4g
WzE0LjM3NDUzOV0gIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MTBjLzB4MTM4DQo+IFsxNC4zNzQ1
NDZdICBlbDB0XzY0X3N5bmMrMHgxOTgvMHgxOWMNCj4gWzE0LjM3NDU1OF0gQ29kZTogNzEwMDAw
M2YgMWE5ZjA3ZTIgZjk0MDAwMDEgNTMxYzZjNDIgKDc5NDAwMDIxKQ0KPiBbMTQuMzc0NTY0XSAt
LS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gDQo+IENoZWVycywNCj4gUHJh
Ymhha2FyDQo=

