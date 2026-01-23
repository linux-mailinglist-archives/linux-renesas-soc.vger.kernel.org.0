Return-Path: <linux-renesas-soc+bounces-27353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKoSLbmEc2kDxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:24:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632E76FDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DA8C3034E01
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ECD31D750;
	Fri, 23 Jan 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dLDKiCNR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958AA163;
	Fri, 23 Jan 2026 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178159; cv=fail; b=XIJw+c8P0REcy7x/ay27BjgaGDtBIryouIX3h2OW44YC1sttXX0nf5Zcbbc7sHo0KZB6hlp7f7nEDvg26gw2zVdJ25RoL4RVuXQK1yzlGNxmen1WUHlqNHrtcjD9M48ppcgen52W3LwMja1BKeJzSNPZE1cV7cUNXwhRuUDKCDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178159; c=relaxed/simple;
	bh=t8EBwfMMyzic1B7LPloYV97nYkVu0P5PLkOmB9p3z9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OJnZE461MWMpfEvmAnI3EgZN6PUqZX9wlVAH3iIgnTP3f33esQb4OO5A+HsQRkPjmisW5x/24NDICf8vNWvnfZAYvXvqBFmEUDF9QA1QQoQTpNtXYp6otCG4kVbdYTf4tIz9SEOrYpGzYANCngyod0HQMWymo74x9wruYxBeo5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dLDKiCNR; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oK4q5z3sUFvU5tA9T/KuLbkX57wKFBCTD+SMsuLfcpzaGEFMWTRHrRj/wDuEpI+LB1SuCMxhMY62XQqNw3Btg64+jQySgchqSs5/sLGWpbmAkbYN3iAtTmAz1go9yE/gGJhfK+7PGaHeqckW1FX5S0tx9trkHr0M9LdNGv3uxqEmqkNvEYEkYEmYvG9QrImc7s/N9RZWxHSOq+7WXgj1PTuzsieE2VcBz8zutSEmtKZ6pl98GuqmDdDJrXWIAIdRZFgW8JS+O0X0Ord21p3wDiki50dlRZeydwaH7vhY7EnaSaIr88ZaG8S4lmKvz0dWOBwimjIrtbV5MDzXem2gDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iDhtpX8TmARoC99ylExpgMkTUyvqwBnJjHmNtombMU=;
 b=LCisHTc9T8FB9cspeWhonqD3Xvjc62DuNO9SLB45MO5PYO03Q1w5EEtv60nQdx5nxUHP4BTUG8HyikezCcraJ+UMjvAadT4bB5f55g6JALpEAW/Qc4xo5kj5UrwaVBoQ27f2l4Ed1bHuEqH4eKVHFm7Zo4NBMxEUgGyaLxePZFpB0SqcJsui8FDeiX2vKFRVgIqcITDY15T5SBMTjskhW1jKQ0tlBakaurkbREpmH+1M5I9A00bBEd/eWHiyD/20bCgY5IxM/Eb4yiey+AQPSfBdfoc+GK6OLC1C9X1nqMoaiIW4Ox01U3JMqnwnqH6WhjwBdSeNMw/W5f6UcCi2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iDhtpX8TmARoC99ylExpgMkTUyvqwBnJjHmNtombMU=;
 b=dLDKiCNRK+iMZcumHhS5CbR+LsVPnRc84ldrcd9/XUIHezix5meIqRW0eT/9Y0WiOg+aGynsrr38mOMe3K0DsMZ79s1bDjLFEyihSFR68aF97Dgot1hafhDG67eoekBVQHay4N12hv1tpngKm2N4AfnRdfzrI16QCE+m94puiWM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15216.jpnprd01.prod.outlook.com (2603:1096:405:268::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:22:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 14:22:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Topic: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Thread-Index: AQHcjHDWJvIbQMI8j0WdDTFLzZ8lCbVfzjig
Date: Fri, 23 Jan 2026 14:22:30 +0000
Message-ID:
 <TY3PR01MB1134621DA412AD95C7373B4AB8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15216:EE_
x-ms-office365-filtering-correlation-id: cf31e6f8-7c9a-434b-57ff-08de5a8ad7da
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IStdTGp0qu92LiZOG7KtCV7xd3Wm7VprNcsazinpsixvAfAYRGYSG74LCG3q?=
 =?us-ascii?Q?/i9XhkwYlPUkWtbap2BPTFVFn7vNrJOB7S22x/B5cCaAs49qxv1uSJmvHnmq?=
 =?us-ascii?Q?X3yGez/0TUucQgNWg/BUOVl6wU8fXG1BBuAcgRuSHZiJbF9uXe8sSEaFbnb/?=
 =?us-ascii?Q?OuzCvOWuTwdmEN4GEGuhI9n8uJ318HX/CTlJePDBV/UXhhjm4LbfzZabrv+7?=
 =?us-ascii?Q?JcLbzVvn+XkLmNqp9yRGeWLuNwTqWcauOl+IC9V6wqibfP/Kdvd0cipBBO9p?=
 =?us-ascii?Q?EK3ZXgfJ4TNHviMe1tv3Jkga07k0geYoV1FBKy3iGf+hVgGMGV9gPI8tQLkd?=
 =?us-ascii?Q?Jyjhu+4FBc26GwYBtoQ1EfPHjrFGVNnW2peK9Im/TyLZRKyNd//TmRNkUi4G?=
 =?us-ascii?Q?Kz5bRGlYuDBnNKfQcQ3BNwZgpoKM7qS4juhQn4jd5iP3CzDLMgq+iUfKXxv5?=
 =?us-ascii?Q?FhTOl1hSrlKkj8hth87LowJ49pJgxWsfKQOXvecqT2J09KY8335qCAINUgdw?=
 =?us-ascii?Q?nYQWdd8HtXoX5apUG6bBdsGq4r1W4jmrkZ9mB0ldgu+HkIQLP5CgLoH2W6z6?=
 =?us-ascii?Q?GLUFc7R6uSYXICLT0GWhcLAe7V+2UZsAXVLVUpE6Eudfcy/M8mQB8u5N/0AQ?=
 =?us-ascii?Q?5faD1ZWKZEgZD9grFbl/XOA7LYL77/H796byjwX6OAWP6lYt9OQrTQxXCQ1T?=
 =?us-ascii?Q?9AqW628U9EzWGRMEPIggs0SmvraPuTVNRzMqREZWO8eHkUoueYt3d28/HoEh?=
 =?us-ascii?Q?dEPti9jj9kwF9ywJCma+TgPjr0dlvC6eS2yGOCLtoLUjmpdDcNScR+VhLNId?=
 =?us-ascii?Q?SSQE0zkJY6WTb5qFHTcK5FpzO/k57ZiFhtFlktEZCVtzoJ2w/Y+ivxLoq+8o?=
 =?us-ascii?Q?mm0L4JWq/EXyWLgfiGltm3NfY4M9/2dP/+whCpSmfbUoCRyjMLzpPxkHJgLs?=
 =?us-ascii?Q?vNZnK5k+hMDE/gbRsQWgvPc80bbWInHdGT/zil79a31qkEW3PiD0ldlAEaBC?=
 =?us-ascii?Q?QzAt+8fjj3lr6sg9Jv7sGiW/HJIzVQ51nrz2zpXCKF7Wd7hCTspNXc9UQAvN?=
 =?us-ascii?Q?JNcu3uCuuzVRB9t9fkNqD9R8uOSfH/td7oKv1+rKJWEpomNvrxVe0s2hJ5zM?=
 =?us-ascii?Q?BIIwpIoyDviTu7P+MRYHRhrh3jAwiZFCwD90mkMepiT0uf159knvZpuoaozy?=
 =?us-ascii?Q?9Me6M2BSV0YxCoTqVaTREmrWOE9SN7EWunysa9o5hawtqodEc15PC6Ku27YP?=
 =?us-ascii?Q?oFGzYoMy7j36z09g7wPB0N+7ftKS0+RLWTNJPgVqyFbg30ekyyks24AVO6ih?=
 =?us-ascii?Q?DDF2/320TVKwYNtTSU/blcPCSk/vWheC9Qt/N1tH+G6HR+tHAPk1JTI3MaZs?=
 =?us-ascii?Q?HLpu54zi20IZLe6+ZO6hROJiDzB+9T263qag6pWOrD6DcU+4afvwQCL8lzCU?=
 =?us-ascii?Q?2lBZqKTrAo/PL/nu/ieRExhbUrO3h/Ce/VxJy+A5DfOAf4cceEMfzUC2sDeJ?=
 =?us-ascii?Q?vHoyWBRjFhgpxEYhgqPVKnJ/z/cFzDsiuOyOXDVkYz4oqxuOX2iPQwBVperm?=
 =?us-ascii?Q?j9k3xJbm5a9KYGbi+t90NaqLzj961soBNTgvtz9WLKkK/sCqMa+lRU96D89i?=
 =?us-ascii?Q?G0ZNo2F3zVngGdRpFAABQ3M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n9JMpJNRgDpGQkoYjyAAtndQNDPSNPOtK01aOa8r3TZOzNnz44Cno8CDmaTz?=
 =?us-ascii?Q?iDhkfKb0uMTEQ/mC0on140NOmUZx7gKQkvwslIFdIXkFMcdFIQeaAfNZTs9p?=
 =?us-ascii?Q?DRgeCpleAZmK/gSfTP9Mzsk4SzHl1a01zRxTx0nS78t3ON968dHcSYS5GMUj?=
 =?us-ascii?Q?UUe7sUv38QMeeGanlOivCgVyFHqJuZuQ0j2A81hbvM9PdK2WXQMH6L3iR8X+?=
 =?us-ascii?Q?Z9zkNxgbnwBSPRmyGAPi8GZSYXngbB0Z9JvX7wD7a5TUOt0C8rDYJnvTIfx/?=
 =?us-ascii?Q?BOdMIZ2h+by+dPn2kdCrPhjalJyHLJD+WHyB0zXCVE+v5kpgOOVMjmqvMssp?=
 =?us-ascii?Q?uwhcxbn6vxw3XDne5YHkeXQkxREwkpYsqwIro/B25Aku96oMEQZLSU+AYICS?=
 =?us-ascii?Q?zNJtEtgjWJL2MPEMa0QjwdlNobNsuDscutE/WyqaylJa5PDUNk05v+rLlf8d?=
 =?us-ascii?Q?MGcAe3zpo41DtkVQfR84aA3DQQI1uz2xVtDudnWqfLw9rHCHU2skhm+M7zJb?=
 =?us-ascii?Q?qDv8hPfNo2+KzXch1R12VMydchlPTdu6cnw4F+t8weKB7h3T+VaT0+pn4yPW?=
 =?us-ascii?Q?IGY2Z39ySRZmT90vvGH5WLxZAAszRvk5P3KaVRZ+9ikfO3z52fJ3uYkx1F9o?=
 =?us-ascii?Q?VOWbGDVpm+nKOBpjA7Kw9I7xGdJUKYOJ1OqUaaIZNWQyPTArDgmDzY7S1w7f?=
 =?us-ascii?Q?nHBEGYJx8h5woTSfL2s5LXoGGQyIGasBtK3VKXWXiThtfHOBABmrV9M6VuJm?=
 =?us-ascii?Q?lSDhr81p5tFfokCanh7B+wl3R4h66ImU3S6mMK4LXmp3UybDAAL2101d1tYP?=
 =?us-ascii?Q?QAHVtYWySdTHjMHeF7rtnL7YKtpfqhCCQu1UWXSuG79w9XPUaywke/+I6//h?=
 =?us-ascii?Q?k5kKJu4gD6zcTCqxG8ZkYu671RfZzLLFyAXVyCYVpifJpMBCv0qxetHayceg?=
 =?us-ascii?Q?Gz2wSX14qtH8+jsOJzbROxkXZF7Z7wJ3AZpZxgJ2CUr7nIrG30dEkxTWvM9u?=
 =?us-ascii?Q?kS3D+DudTaGrCxL4h2+hBHQcH7V2nAyFW4TEmRIYLvGAuxNJ7Mvvg4X58xVB?=
 =?us-ascii?Q?73lROKVXVwD+BDNsRFz31b7KSpaSAJOCAOjKARTYyZZC5kczq+RrVYDUa+o2?=
 =?us-ascii?Q?jXOHtWBIu2y9H52wT6jt6vhnA8ROc4p2tZUsPZtetj2Rj9cfqVkmwesf/FPV?=
 =?us-ascii?Q?QnL3vXHhbjgd7cGuST1hJ6oMfIl3b/3kxT+nVrmSoJPnS4u+xChG9r3n7qxP?=
 =?us-ascii?Q?7zuEudVjg2K6R9MicmTqLQTz8ETbGD7AnRjU0lWujMsUiMAau15W30r2DMBn?=
 =?us-ascii?Q?SIcNmQoNMtzK6+PvnT98DknZsW83MUuSckR6yuqh9VBQ6buK0Y3UOFIBmY2C?=
 =?us-ascii?Q?gE0pBTyE7ZxE3LjftVC7sUypwu5rP48tsIe/lnJh/w409aWYJ/fJK5iYn7Qp?=
 =?us-ascii?Q?0TU8mPZchHTu51wmOjCoF6t1N4r4jR9UUOu1K8PI3mMKEi6qGqsxcGl9Ams4?=
 =?us-ascii?Q?5eGlbw7gI49nQWOX/jaoSGpKRgKyCE0cVdDhJb2qBPJCEEFUytFIPpj6kZ7F?=
 =?us-ascii?Q?CuEkK9+E5e5iWYnIAUNeWO67SvzdRPypaYkTFQ1GvDfdptvzdnE4rkx1sHbP?=
 =?us-ascii?Q?LcNK4yuTa3sXED8hQzSokacBI4sEHHPTKzC2Pz13b+kxUULdRMfn91X8FDAu?=
 =?us-ascii?Q?AqdYc9NusmsSeXxwRt4u2DyjkZxuiTyqS/954DE0Ggjq3on798sdy4o2ouvy?=
 =?us-ascii?Q?rRhG5F1GJg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf31e6f8-7c9a-434b-57ff-08de5a8ad7da
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 14:22:30.6461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OhpSks1175Ug4WQuAa4ulSN9h1XOm5QlUmLhSqRfcnPt19EY9KS9Y9ibod5QiuS/iqy4k3n3ne3UmEQcryE6C8zAQYZktbHGG84ofMD86r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15216
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27353-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.994];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1632E76FDD
X-Rspamd-Action: no action

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 23 January 2026 14:00
> Subject: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Do=
cument RZ/G3E SoC
>=20
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe controll=
er to include support for the
> RZ/G3E (renesas,r9a09g047e57-pcie) PCIe controller. The RZ/G3E PCIe contr=
oller is similar to RZ/G3S
> but has some key
> differences:
>=20
>  - Uses a different device ID
>  - Supports PCIe Gen3 (8.0 GT/s) link speeds
>  - Uses a different clock naming (clkpmu vs clkl1pm)
>  - Has a different set of interrupts, interrupt ordering, and reset signa=
ls
>=20
> Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v2: Reuse G3S names
>=20
>  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 127 +++++++++++++-----
>  1 file changed, 96 insertions(+), 31 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie=
.yaml
> b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index df30f729d4b3..9565f1774720 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -10,17 +10,21 @@ maintainers:
>    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
>  description:
> -  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specificat=
ion
> -  4.0 and supports up to 5 GT/s (Gen2).
> +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe  Base
> + Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and  up
> + to 8 GT/s (Gen3) for RZ/G3E.
>=20
>  properties:
>    compatible:
> -    const: renesas,r9a08g045-pcie # RZ/G3S
> +    enum:
> +      - renesas,r9a08g045-pcie # RZ/G3S
> +      - renesas,r9a09g047-pcie # RZ/G3E
>=20
>    reg:
>      maxItems: 1
>=20
>    interrupts:
> +    minItems: 16
>      items:
>        - description: System error interrupt
>        - description: System error on correctable error interrupt @@ -38,=
39 +42,54 @@ properties:
>        - description: PCIe event interrupt
>        - description: Message interrupt
>        - description: All interrupts
> +      - description: Link equalization request interrupt
> +      - description: Turn off event interrupt
> +      - description: PMU power off interrupt
> +      - description: D3 event function 0 interrupt
> +      - description: D3 event function 1 interrupt
> +      - description: Configuration PMCSR write clear function 0 interrup=
t
> +      - description: Configuration PMCSR write clear function 1
> + interrupt
>=20
>    interrupt-names:
> +    minItems: 16
>      items:
> -      - description: serr
> -      - description: serr_cor
> -      - description: serr_nonfatal
> -      - description: serr_fatal
> -      - description: axi_err
> -      - description: inta
> -      - description: intb
> -      - description: intc
> -      - description: intd
> -      - description: msi
> -      - description: link_bandwidth
> -      - description: pm_pme
> -      - description: dma
> -      - description: pcie_evt
> -      - description: msg
> -      - description: all
> +      - const: serr
> +      - const: serr_cor
> +      - const: serr_nonfatal
> +      - const: serr_fatal
> +      - const: axi_err
> +      - const: inta
> +      - const: intb
> +      - const: intc
> +      - const: intd
> +      - const: msi
> +      - const: link_bandwidth
> +      - const: pm_pme
> +      - const: dma
> +      - const: pcie_evt
> +      - const: msg
> +      - const: all
> +      - const: link_equalization_request
> +      - const: turn_off_event
> +      - const: pmu_poweroff
> +      - const: d3_event_f0
> +      - const: d3_event_f1
> +      - const: cfg_pmcsr_writeclear_f0
> +      - const: cfg_pmcsr_writeclear_f1
>=20
>    interrupt-controller: true
>=20
>    clocks:
> +    minItems: 2
>      items:
>        - description: System clock
>        - description: PM control clock
> +      - description: PMU clock
>=20
> -  clock-names:
> -    items:
> -      - description: aclk
> -      - description: pm
> +  clock-names: true
>=20
>    resets:
> +    minItems: 1
>      items:
>        - description: AXI2PCIe Bridge reset
>        - description: Data link layer/transaction layer reset @@ -81,14 +=
100,16 @@ properties:
>        - description: Configuration register reset
>=20
>    reset-names:
> +    minItems: 1
> +    maxItems: 7

Not sure maxItems is required here as Items has 7?

Cheers,
Biju
>      items:
> -      - description: aresetn
> -      - description: rst_b
> -      - description: rst_gp_b
> -      - description: rst_ps_b
> -      - description: rst_rsm_b
> -      - description: rst_cfg_b
> -      - description: rst_load_b
> +      - const: aresetn
> +      - const: rst_b
> +      - const: rst_gp_b
> +      - const: rst_ps_b
> +      - const: rst_rsm_b
> +      - const: rst_cfg_b
> +      - const: rst_load_b
>=20
>    power-domains:
>      maxItems: 1
> @@ -128,7 +149,9 @@ patternProperties:
>          const: 0x1912
>=20
>        device-id:
> -        const: 0x0033
> +        enum:
> +          - 0x0033
> +          - 0x0039
>=20
>        clocks:
>          items:
> @@ -167,6 +190,48 @@ required:
>=20
>  allOf:
>    - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pm
> +        resets:
> +          minItems: 7
> +        reset-names:
> +          minItems: 7
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-pcie
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 23
> +        interrupt-names:
> +          minItems: 23
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pmu
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
>=20
>  unevaluatedProperties: false
>=20
> --
> 2.25.1


