Return-Path: <linux-renesas-soc+bounces-14242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA179A5B5EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 02:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09C81170C0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 01:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9A21B423C;
	Tue, 11 Mar 2025 01:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FxbPFXgf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XIlXwjbw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548535258;
	Tue, 11 Mar 2025 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741657087; cv=fail; b=T4b4cqWI9i3v6pQomM/hhIga8hRyqyL0og/2m72kYdCRwLfSbxIgmuriSrj70/xmdK25GPTnWo7iyMUDR8olvNnrG6l6cdzP8wsKXuwvirg7xuN+zWHLdjBagp4ypctfJmDFUs7X1Etrm70Vwa8s8TV7/Qp37uzYgC+pTyI2KZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741657087; c=relaxed/simple;
	bh=zIhJPE1nzRX7IjWh9+Lxb/VYgf06DoVzN0RYbSZhpjY=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=eIDe3jAar0o63EzWbs6eWvTiw/O59fSofhXNtAcfeEh6j7fM0Q1wUjvdS3EVOndK7bUHfE6pcLqeOlA5Bbb9foR5YxFeGUg3qHj4p+yvNXa2346HxVTRvKx9gXL3uDyDN63dup14y/JV4N506lHKq8Y+P9bslTYpKSkBUYDcZa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FxbPFXgf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XIlXwjbw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ALfoV0021241;
	Tue, 11 Mar 2025 01:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KCkzfSKa6ZNJloSirN
	GJno+03CuViY9uC6IthTbybRk=; b=FxbPFXgfOWKhBKrfArj74EMNp/bOp//p/q
	hgwusKuAXyJm3DaQwMOhjiX4U4EVsdj3lULfISkWMEbdgBBCF9vNOyUU43TN1jyl
	46gEZPuqVCX+45GJ0lZwH8o8H8O+CfWNdRRvPBbS7e/1yYDmWfyPBqyyDjoV1DCp
	3tFR3dzNVwpzusAbOYAWyiR2xTgA2pt2tltn7tewcpXOz4HwA+kaGjUKUPWCr7qj
	o32TYCjbIAwDeb5kLwyQ7xxYC4ufErmtEbiPKK7vb0y8RPhyH/lp8rMvaPApJ/+4
	Lbyr6LBzzHu6G5yrTQpjxEyZDAiHEpn1IEZEQNctMSfu27WTOGJQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458cg0uxkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 01:37:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52B0FjLN021730;
	Tue, 11 Mar 2025 01:37:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 458wmnvcgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 01:37:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKQ304L65mI+MLYEkw9n/1ReU+I3+95L6FzU7GHWFJw2xGyWuJOX21eAwao4MIkArEKNbRo49hK1JBReMvlfQix5+Qcj4SQRk8y/trgvSjte1bN4qUCIXC40A/a136JZQ0QEX8h6fr4pRgwA5Dw0C+V2lePSJ8NB4sECn/qzPm/uV8AnIgYDQxBWD8kJeXxOoi1nic8Ek6Kvd9rxTcZJlO8MUsjlJ7U0jhzS+93fWfFZwKqwypyglh93odlT9JSXmfIkYcW5YEasTGcBLIt894rVwYhZcioVMt4k1kCyKX1Olhn1xca5qbp/yvabiBfqq3PNiyqF5sugXKA71pPILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCkzfSKa6ZNJloSirNGJno+03CuViY9uC6IthTbybRk=;
 b=A2IXzwKvxcvJUTDLWxkf5Q13tENerymCLxLBTqUaindEqrGv6JT03kXpH7UB6fSr5wS2vXLRpzggi8qypwQ408dKpfup1GlMdHPZLpLA3Tcm+rTG+zbT8dXkNWXPQQNqr7KNyXG4gtqEFHLoH6vgWB4a37gV25nhc1l63C7RVTY5efUtKFuJKjlTOAqMDbti2b12/o2Zjxszjw5tmknBAdBr0et8TXPKtGALZMtzgz6igDVtwrM/66GwuJWPDtyfuGUrVW1AZonCPwhZmNxoWNgQCjjWTwXbhN0r5b9vXlVzvgMSnMyJHLdNcJ9yQJmV+QTsmWHiLK8Syr9ccHSx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCkzfSKa6ZNJloSirNGJno+03CuViY9uC6IthTbybRk=;
 b=XIlXwjbwfwFwWWK7PitgK8D61zPF7EA9aZnPtebNivGCZ1Kcdmz3O5+K2Blz56nDKf0pPQRZfB1Z9OXL1VFWEHYzuEUbeAW4pVO1Yih6ZXiwtSyhWE58+11MAzgZjBhqkH26JD+6p+bt3olXMLI8eWdyL9wgnyfRmQJP/NlaczI=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SA3PR10MB6970.namprd10.prod.outlook.com (2603:10b6:806:315::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.23; Tue, 11 Mar
 2025 01:37:37 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 01:37:37 +0000
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "James E . J .
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K . Petersen"
 <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/7] scsi: ufs: renesas: Add support for R-Car S4-8
 ES1.2
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <cover.1741179611.git.geert+renesas@glider.be> (Geert
	Uytterhoeven's message of "Wed, 5 Mar 2025 14:34:08 +0100")
Organization: Oracle Corporation
Message-ID: <yq1ldtcibzf.fsf@ca-mkp.ca.oracle.com>
References: <cover.1741179611.git.geert+renesas@glider.be>
Date: Mon, 10 Mar 2025 21:37:34 -0400
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SA3PR10MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: fd70afca-d3d5-4531-b860-08dd603d4dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X0EXkO8i1hFdEL/1db/ij945856KfW/tpSHsGfb5baGq1CSb/FXA9UgfKa+m?=
 =?us-ascii?Q?Am8QV+dWwxfK2zzrH+ZdUP35T2Om4xCBFrqf0R+ffmhDWUQmdQkzpfwY9BZk?=
 =?us-ascii?Q?pInhG977OZtEpyf3XCLq608GsnxR7d7bPQfMgm5sBCPPZu7wIZyNehme4CvY?=
 =?us-ascii?Q?w+EWojXCYBlDCJk36TqqC7vlma1jqXoa3kwncXfuwXb5oNH+17IsWS6OHvDy?=
 =?us-ascii?Q?tI7xSa/ATW4MfpUPoa7GWWTQDXtUPbthDtO9l/IS/IQDuD6h3nRh1ubhI04R?=
 =?us-ascii?Q?34aiK9nzKBv1WSs4k63I0MK/Snk/lUez+FabS7IAzzjQtm+OxJDkyQoHkcLa?=
 =?us-ascii?Q?cQ0mmjR7yCfKXh/LGvWFbxOXtovTRdczhtsy33Ogn6Yz1fbuHv/gzB7TBlnT?=
 =?us-ascii?Q?AahYgG4hUcXcDuHgnfC59KNKDDU5v/jn3Ix4u/C3e4OpZ0u0KTBFR1lyZXoA?=
 =?us-ascii?Q?WmRAXeCM2lPl/6A5OQSWrkqESQE2eeZKL0w4iqVgTBOETFkCrXl3+DnPYTHH?=
 =?us-ascii?Q?p4HNJyKalpG7G15G3wOzsJ3j+BjY3W3Bo+Oo3IEmongucSFgrLDLtW2uBEFH?=
 =?us-ascii?Q?Vvzq6m62ypR+i215/QM/+SYvCZ4CjNZN2AyXWOuKc4daQRMGDmglRFpzu1kB?=
 =?us-ascii?Q?14e0Hir6dXnPsPACz2E661Ds/wi/lIX+lwqZhQBflsyfC4U1w5uJFi0ykWZV?=
 =?us-ascii?Q?2jor9HTEu0x30QeulaVwf72eghCQCSZDsR0bo42JrO/tb9nhivdZSuDiY0wx?=
 =?us-ascii?Q?moJW/IkeB1YI5ayEIsjcGAexbS3XqllP6Pw7G1uemyS/y9+qru/tVGbdZaAL?=
 =?us-ascii?Q?LmOMBfFhaVb9lzMzqEptRgAd2nLb/y9n7E5qzwku2k6p5DlSFtzOgT6+tE5Z?=
 =?us-ascii?Q?T3VBQ8BHo4f/Qnh3d82HKb4YLaWvVftuXFrWwP/NxojSUcPfcvcEnVO0e2+Y?=
 =?us-ascii?Q?x8LQtzKP5ejVu7vgFXUtnlrL/9/pZ+Jxd2pYiPXB1Bpc0wZG53iN2WMUMhvM?=
 =?us-ascii?Q?7DcQrH/tP6iR22XbhLvjYomZIO32gi6wMvP6a/sv9GSGeeOLh0drXWuXXlr3?=
 =?us-ascii?Q?9Uncph5jjo7kvuCKFWLmaV8Y5gVuKOR3DpSjnofTEnx4CCVJpUmuwjktYZE1?=
 =?us-ascii?Q?2mkJCTU59mJKC+FuLIpHrxaBK+D9C4oKIic9if+DEKUxVxwdWgZ35otV9+3U?=
 =?us-ascii?Q?dvQ/QqR5lUiyiGT6IBBEFbmGKYi1VIFGFR7hskfAN0zBDi3honk2/SFTzXYq?=
 =?us-ascii?Q?UfRYZf2yuJadYLhu2uyUYu5gpctT4ykc90kq0gmN+e8BDtmCjD9qf4Z+ZSId?=
 =?us-ascii?Q?LnWU+sRZ7jw7NhrTXnvwyFtiho6y4jaCnvNZU44G1g+94qPz1ucf7Qv4ILyD?=
 =?us-ascii?Q?dfS7wzxqPfEqY5EcA77VrgXiqhLu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rQaGy7QMYSVE0IRE0MBtoI1HEZS7mxIR62+Q0O705w0/QcdJ8hXK8gZzsjrd?=
 =?us-ascii?Q?gynRkAfm5D9Zez8cG5WPwnyg7RRlKL8AEyDTlHNfLEPHkrpMg2hLrVYfdy5n?=
 =?us-ascii?Q?gGCTUZ3TcaZDQNSYDb3xsPUEMc3DEZqrzD9+C4YzPuvwXkQ3qvN2iHU/5Vxn?=
 =?us-ascii?Q?P9HBjIw3KLnmZvZ6K0HTx9HBYq57a2gBwA6z+cxng3XpmId65kCdW4pwrose?=
 =?us-ascii?Q?Cjl/+JslWkoZR7l5GMMEVQpjBtCjmyMvomvnBV6BwoLnOQuOspmaoQQfz6Zd?=
 =?us-ascii?Q?2aQOHofTI6dKSC98oUmJ+okkDE7gk2LqasnbGTBWSIeFGJKe2vyltmje+Jgp?=
 =?us-ascii?Q?Mqn2CGUYyviAguncqjIOUAAx8uL03n4WqRh1Xsb7KPQjoIuh2QA2QJpcNSOs?=
 =?us-ascii?Q?q4x7Onx8IcrUwFK3hPIddzksXd/k0a7GCLYmrC+HVnJZzIO0bdv641k0vpdw?=
 =?us-ascii?Q?F2noO/ReRNceXg/TR2n7komx7wazfOF2x974YAkN3F+8O1QelEHy0IK0mWUR?=
 =?us-ascii?Q?618kYxt5Vsif5cTKDpXIZ9EL4bC0mmfHuEzqZHUbvhsqZ+UD0UduKKkRMmfh?=
 =?us-ascii?Q?ywsgLjG7WLEqwkOMlFUp/OXSCgmakFR5SN+1VdjY97fkJRwca78TJSSk+xCX?=
 =?us-ascii?Q?JOJaAkApYOoUbjMh2L0Ocj/ddTndSJn/g69t9y7gFlnWUGsgt21LoxMXmRYp?=
 =?us-ascii?Q?cklyM/qdymCP3RW6PPW3W2AMT/hYETI7cRSsMg7hsXyg7c9vw1gd+OXKdo+8?=
 =?us-ascii?Q?BQbSkXOcVYqMw3TmVukZXlBg1fQQvDJanhwqJVr5BHByYThzwhdGwuLpRmaq?=
 =?us-ascii?Q?pknB+8CB1JfE1/iXDstr73llI67nTrrZ3EzvoMPFjRYJNf7SX8/QHccdRnsW?=
 =?us-ascii?Q?4XJiyqjEJds7K6P3WkK5rOXcd2YA95prVd9xPrsXh84IC3/t38xek4tVntB5?=
 =?us-ascii?Q?dCO0mDW4X8s+lW+qRRfHpu6haKgrHaQT+9wJsbmonUJ+hqZtZEzFJTej0/At?=
 =?us-ascii?Q?RauGFRKTbrSyCVVOzj+TcxGj3lfplxhWvsBlLMqXGG7vM5ce0vY1n5KkNliY?=
 =?us-ascii?Q?nF3FFJzG3VIWoXXoQhwPGRfSR8VlRvavdN8ntHOrtMKvt7Iqlp8EsooCvW2E?=
 =?us-ascii?Q?bEok7bwv4VsKVuX32GH1cszUGSQoLkzxEat8BMnb/Dw3boODbNXsNpB+s5De?=
 =?us-ascii?Q?CPN4XRLoNZY0YsiwDvcXshL45aCRfoVwKd+KsFhhj4B6H6n138uGk+ioJjaO?=
 =?us-ascii?Q?j1d4aPHGLrbzDo+cSEVEBKBhlYVVkGDsx98Unp0XHShbStm/pEcEfvzd1UHG?=
 =?us-ascii?Q?sUtTDeRQADhXc94QIoo//S+Rs0z948wtAkHKPxwtGCAjpE2b+do70lOGlPGP?=
 =?us-ascii?Q?RHpml9Ock4PiFcfrgPBS/ovV7F2m4MxCg7XyRY+vN58iAwyMkMseHYHg6I6I?=
 =?us-ascii?Q?u+bTL6/lGGwD25zq8pWtI2GdENhGFQhwIwK5EHVrHyaBCyBXBywDFioYmvls?=
 =?us-ascii?Q?LlC0P7SEzxT088rEicZ9CXTqaGwAhiOj8K1PI2+H8ZjEmpEf3rzzC3vkmcz9?=
 =?us-ascii?Q?CODw0J/KxuC9yhXLWzjtffg3LMwrXfp0epmHkfDjqtCqNR9gV1t0LoCI8IVK?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9iEY8lAXypS7I4lsFjEfq+rQfQuEg7THj3De0cr/77Faa03efS55IYsKcKPrjCXGBiVMGK3PdE92yRpY4EaJc3Z13HNmholbXqc72vvREYSlLvwODMxGoMLgQahArRkHaOsHCoTCOgcXNWTFbN/MKNaKGNa4FbWZJrJuHe5dKrolcjFg5K0FAfCZVRI6D24P2NlFiq3abhw/v5pi2w0Girb0YPkFsoBMRjz94+kIzvz4F57DhTIPjBiJhWiJHpfUNWh7uAq4F7dHfANnrzocZY91e07J+MhKgcCYJm25EePixF68b7LPOlGQK2Dl+M1ROoosIAheiIeTO1fgUz/Hl4PbomzDoq9X0zYvcX6SBuSQYxmbU1xbNvdHyCIG3hBweZOW1ce+PUtRJahERrM0MsV+3xeEnsuI4G2EaKGS+2gHQUG0jrYoObA8MmLW1gh1ZCmlPTtGUv5FB+Ut8cJx6qw3qUSkEtuRrJOO0V1IE9m2nALXl9Nqf0ows37ZCKv0fROy568S8ByyM7MwlxENL8ma7BpkqlJTxIiyvY3GkdLsJSj59ZhrjTr1eFpUXgf5nsgimesDO85FUnCniDwa5cOvbsEl7vpQ19HNDNBu5lk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd70afca-d3d5-4531-b860-08dd603d4dee
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 01:37:37.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGGwqCdoYJ+al0DTKebSclc96vOm58KqWlC2DqdqO6wbr6W/v/dC84pklqv9SAz6Z6tNsVTmVs5B/HdWFmD8Thu8ybgMcTqhn3YNzrddm8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6970
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=924 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503110009
X-Proofpoint-GUID: 4pQl2aiQpWZgU0tM91PdumeGkUDjTpl3
X-Proofpoint-ORIG-GUID: 4pQl2aiQpWZgU0tM91PdumeGkUDjTpl3


Geert,

> Initialization of the UFS controller on R-Car S4-8 ES1.0 requires only
> static values. However, other UFS controller variants (R-Car S4-8 ES
> 1.2) require dynamic values, like those obtained from E-FUSE, and
> downloading firmware.

Applied to 6.15/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

