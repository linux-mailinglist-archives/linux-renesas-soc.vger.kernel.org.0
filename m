Return-Path: <linux-renesas-soc+bounces-21051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9245DB3AA2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 20:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485053AC0E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 18:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF88A2773C6;
	Thu, 28 Aug 2025 18:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J+AkigYp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nfjRsU2w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369030CD84;
	Thu, 28 Aug 2025 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756406555; cv=fail; b=PmgfUmvsgDMInrLCHlTcku0OwEJT6387hw3RntcW6pqdCvMHcjQoCISWjar4AHhN4bSMCJTs2aMlfi+xJQj4Rr6EqCxUQ23ezA4/P+E4bRWhTKLNEhzX5fptU7ldG6q6BZE6vlKdEy/ppCPZOUKlD/HxOJKdrJLXAOeSJtAAnFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756406555; c=relaxed/simple;
	bh=Bgx1EpwqK6zQ/qMFUtljTBp9LFns9wtaJVgRTK9I/k4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bCLS+tGwaJUCpGiVwey/S4fefCKyvyBymQ6crtS2EH75ymjCEh9szoV+y0Rkf09fEcS77CzSyopPg/3Byolvz/VUf9oBSjqUe05fclkHvf55nvc9U0bDd4SVPYGVR1R3oCVM5FPnVuvEwwWXY0NDuSuUMBgTVNu5zE1rTP/hL98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J+AkigYp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nfjRsU2w; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHNW3q017180;
	Thu, 28 Aug 2025 18:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xqSBsTc9n48mUOvGE30fk/9CIhX8PyRl8GlPZxeJwwI=; b=
	J+AkigYpyYFt5YUkxX8leLBZqhL0pykjWVzsmm4OAEyAnf+YunmF5NhkQ+LcRN4I
	qV82jfKEIYHQMphal+52ASrExPMSeyqkr3xca8WR5kyeaD2b7Fz7Kw1ep8iftFXz
	lzXuLU580ILBfjjCDdppVqFmB9lHdpP7bret7ZpnWrirXR81Gto1Y0AVegY9K6SI
	g+VH8IZv1MEpkUV/ce8RG0v5ULWHj2gORVqQ7fcEVNHqTY8SWNjw1DXIkCumdUSn
	Lp+UAjyog7BRv+traiEhm773oFtqNw4D1eEgCON/RcK7do/X8Xfw4LqchElj8KQC
	AWRTE2jqzd5glKHgY9WczQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q48es8vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 18:42:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHxvUP005064;
	Thu, 28 Aug 2025 18:42:17 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43ccvc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 18:42:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1o1UU6pQTn1TRsfNLzH0vt74pQoWpUkpUYpHAb8F7CsNlpB+uZafLIxEjXMdb8BTBP8sZeOTsqg2JMO/L9Nnohw62hL1Xj93XD06iIBiNmQPVssnpgvKBBUFWFo/yyO/Q+4PhUvGYfMsnymhjY4rBSmidQLaj2Z9czJD03MVrUA0DQg2788r+AH4IVe3irH/wdPPeYh3eBpOhGUSgKawbaJcup0+twesh10p0ZVTupOyn1S0q5qDdAT/gn1qdXQFlrsYmdApJDyg+HwGYTvXQv/7Do9lCeL76K9fGFutg+p7xAsi1pGnUZAua/1nLgOwx4sjnOqaJANy1LurqIzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqSBsTc9n48mUOvGE30fk/9CIhX8PyRl8GlPZxeJwwI=;
 b=jo0NM/h53vKUf6/lC7cD34TbmILdTEXP5fuq00ahSF8bs9yrO8LzBGYTAiGVL9UoPqcYTqJT2034oA8wmZ8YZEIV4oiDSF2BbiHihAifqwqRt/sbt9BabUyzrByltgZnmQthXebpXekPwwMvXTMt6QvIUG0rrLOnlpT1gCM6yiTVXaEzdn8j3eF0z8NDWq28slZsqItYYrwOfJQrIDBW7JjajcZ/kxYImmPy0+O2oE64kqFCoJpiZJCoMOJ1pCxrd8GFgaPqfpBsJdWzrsseo69Z7jPd9VwHuVW28NFt9WbYjIajMM5hOG2BDitoyK7n6gSonZ76ZbRMhB3LZR/g0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqSBsTc9n48mUOvGE30fk/9CIhX8PyRl8GlPZxeJwwI=;
 b=nfjRsU2w/F2V2SZUSgPuN31opc4G+nfWdd2OwlkufwiY0A8fziGRQKivZ7TXlASmajfZGmmtu+sViOYmi5I6zQCjU+dx77Z9H3wXzGGS+9+tXMC9Cu77Q7DKBbfmEMDJlkNcJL8d4235nYUFb5xP9/wp5EKbc+Tm7x1anTQbLwk=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SJ0PR10MB6421.namprd10.prod.outlook.com (2603:10b6:a03:44b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 18:42:11 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.9073.017; Thu, 28 Aug 2025
 18:42:11 +0000
Message-ID: <2fd60e1b-a234-4663-ad35-1696a6fd6827@oracle.com>
Date: Fri, 29 Aug 2025 00:12:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/4] net: renesas: rswitch: add offloading for
 L2 switching
To: Michael Dege <michael.dege@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
References: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
 <20250828-add_l2_switching-v4-3-89d7108c8592@renesas.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250828-add_l2_switching-v4-3-89d7108c8592@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::11) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SJ0PR10MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 29151e76-e219-4b24-fc06-08dde6629916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDJKN2l1OE1aWHF3aVdmU0w5T1UwaXB6R2dTTUNISXNPVWgwaFgrZmovK0Vo?=
 =?utf-8?B?TUZsdGw5bnZlSyt6QXE5cVRwQkphS29KdEhCWFQ5YU8rUFBPUEQ1Y0FqdW9J?=
 =?utf-8?B?Ym0rcWJ4QWhmYXZSL28xbDJDSCtUUTJDUkdVaTZiSWxRWHdkbERJTmcwaTlr?=
 =?utf-8?B?bTVSU0ZOQzgvSkNGeVRKKzNQeFdCdHJab0F1aFBVZDJmVCtkZ1NBRmk0Skll?=
 =?utf-8?B?cFZkeHhpQS9SeUxqMnNaaTRaN0IrN2tXTld2YzBmbmpycEhXR04xZi8wZ2hS?=
 =?utf-8?B?bmJUR1o2a0J3NVd1VTVaRGVuWWpsN05wL0k2TzFyV3hCRjBlZVQ1QWZoZjdJ?=
 =?utf-8?B?MDJ6SVYyQmNxZm9TeGFuYnA2Y0xRUDVRbThKcFZTTTBrbXRSaTJkTUxCaXhD?=
 =?utf-8?B?YUxib0h5Yk9UTmRjVGhCN1BJUytvUEc4YWZOWlhFcG1xbitxTlBjalJBbkdE?=
 =?utf-8?B?Qk9iVS9DcjFJeDhkY1N5KzV3QlBZMHZRcXBrVERRcHVYbnpjbitMS0V5YjJo?=
 =?utf-8?B?eVZWNlR2VVVTU2krWElCMW5EMVRGU2xydUVwZm1kaHBIM2haSENzUmFiV1Bh?=
 =?utf-8?B?TDI3MWEwZCtGOWpJWGlTSWM4VWcwMlJCYjE0eEo4SUxGTTBTL0hRcGxGbmRj?=
 =?utf-8?B?cmRTaFhEaFJIVDRKdTd6TCtzMzBLZ0NQdjZJWXRlRHk3cnpPbGY5ZVNNdmNs?=
 =?utf-8?B?ZTRQNmFlbWRnTW9GL0RNa1o1a0RaQXFGbk1ScHUxWUROZnBMQTNGR0NCd0lS?=
 =?utf-8?B?QmltSis4WDB3UkZYK096bm1SZlZJSDcrZHhyalYyc0ZmYjc5S0l5QStUUjkw?=
 =?utf-8?B?Qi9KQkNlZlc1MTZDY0FmQUpwNnNCT0VGU2R3eTE4eGNEZlIwWXZxbXFVTnBi?=
 =?utf-8?B?ZFpHLzhCOGUrY0dHaVA0QlUzdGtROXUyVUVWbVFoazJybGRqdG80aEkzRm5V?=
 =?utf-8?B?MzNCcWtOYUJOOE9XUFYrTTNURjhPdlRXRHhBVzZkdStneE9Eb0ZRaXVJd3Ev?=
 =?utf-8?B?V21OTzNMSGRFam5XdUtiZHorNHNDQndVU29hWEZEcDdqa0tQazV5Q1l1a284?=
 =?utf-8?B?OEc2MTdOeDFTYTh3STZVQWpsa0s0YVdGTlR2VUZiak1TdUxwVTJWMC9wd1ow?=
 =?utf-8?B?Z3VuanBaNFhxZzBZRzN5VHR3bERQYnp6cC9UNUNpd0JRZTQrTkxhbXgzYmh3?=
 =?utf-8?B?dE8rLzY5QUZOMXRsS2Ziem5nS3F4MHVGWWx5U1hWNmhVSVJLeC81eVFBayt0?=
 =?utf-8?B?bVFHcnMwUXZuSWpuVU0rVmdldVI3Nk15Wk5sN2cvWHd5NzNIbDY3VTd3eUYy?=
 =?utf-8?B?aFM4b04xRllHa1pNN0RxNGlWSWpzeE5JKzYwZ3RXT01nbHMrd0ZMVzFUeVAx?=
 =?utf-8?B?ZVovSmFBcDI3Q2EwMXB2aWFSWnNsWVRORUF4SWxUYVpyRWhJTVhGaHQyOElw?=
 =?utf-8?B?QTNMTEIwYXA3NmdSYTRIU1h0ekN6b3dZUnNyQVRLNmIyRzM3Q3BMNlIvb3lT?=
 =?utf-8?B?MURIQktYZ1B5T3hhQ3hweDRHVzNXOXVnNFczSmdxNzRvSmhlSEZSZ3NrWmVy?=
 =?utf-8?B?WWdxT0c1eHdna0NUZnFUcVNyNWRZUUJPcTNpRC9PclVvL2VhWFpDSFNkSkhq?=
 =?utf-8?B?SUc4dW5lb3VReEZHSytMczZ0WmNmZFNjL05Xa2xKRDRpV2xaeDdFTzZaWTFi?=
 =?utf-8?B?VVhFdkZpMXFHWEZ0aFAwUG56ZzNlMUV1M0YxTHZsQTdINVdFUFBqbWJsSzlO?=
 =?utf-8?B?Ni9XZ1FDS1NyZExkQjNEeVpQU251UHhFSVhxbmFpaDZVLy85ZU1VRHR1VS9O?=
 =?utf-8?B?OG4yZ2ZQK3JOdkpzYURFZGhPSUVMMTY2N0cxQ2VpUkxjSmxWZmFzSzhJNHZ5?=
 =?utf-8?B?NkZyUmIyd2txY3VFQlplVFo0dHBpNGN1cGxKYnJMRmErL1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xpL2dUUFkyRWdBYUx3S3JaZlQxeVljbEg2VldVSzZSNHM0cUZBdmRKMStR?=
 =?utf-8?B?RmRmenQ1M253R3ZsTDM2ZlQySEVmSHlCUzlzcDZqMXFLdlNBVm1TR2l2cW9X?=
 =?utf-8?B?MTFmeGhXOEtzbkw0Sk83NGFPaktQZFo1TjNaWURaQkpEWTgxQ2tCTG5KakRj?=
 =?utf-8?B?VTBmdSt5ZXVMUE5OQzZjNUFhdlVUdVJ3c05MTXAxOUEyS2hUeXFEaFdtWCs5?=
 =?utf-8?B?dVJFMUxVaDBObDBmSUJ4UjIrUzJRNEhBY3pycVZ5Y2dRUlVoMDZ1T2hhK3gr?=
 =?utf-8?B?YVBjZXRNbjBjM0t6N3ErN2JLRWQ2NnZqV3d6d2lmdHdxUFpmQ1lnYUVocWpu?=
 =?utf-8?B?VzZDMWdndWRBRVpUazBIT1Rra0JpMWZvcEZmWmNTZ1VmbjhXYVZOR3RyY1My?=
 =?utf-8?B?N2VCUDFhbnBPUXdBQk1GMFFYaWVVSHcrY1BvWkFzMHp3dUhOQzZnWTRqeC83?=
 =?utf-8?B?M1ZyRmpWeDlNN3cwSCszeTBnOWYyRkFoVlRLUW9DSy9IeC9kam1FQnBSeW9h?=
 =?utf-8?B?MDQ2RWNuSm54bkZTa01LdHBpcmZ4WkdaTkJUV3U5ZVZSVUZaUURLdWRDR3FI?=
 =?utf-8?B?ZzcwVTV3NHVnbmZhOVYxSlBhZFRsVEJMZ2tZOHZkQXYzNUZCdlN0eGpjL0Qz?=
 =?utf-8?B?ZGowdmxpMTdtVUN5SXMvYmNySHdPclJSWGZEVlBHZ2l6YUJkK0pXc0xSdTN0?=
 =?utf-8?B?VWdEZDZUTFg2QVpvN1ZzRStWaVlTQUhZeitFZ29IalZ3QlJaekpvMDFjMSt5?=
 =?utf-8?B?bUVpZWIvRWlBb3pwd1dqZmM5bkdjUFlMcHYzMDRVWkhlUXJIYTlXYmVrcng2?=
 =?utf-8?B?Z3lVTFY1N0FLTFVtSHA2b3lUQmMxc1Mra3pXQVAvenBCV05IU2JJZzRaK0Iy?=
 =?utf-8?B?QjhZQW93SWlkemtTRUc4cnFtMmd4bXAwUU5sQTdEbm16TmRCVUlyZXJ0WFFS?=
 =?utf-8?B?RVdlcEJvbjgxYmh4dHE1OUpueDRnRkdoakFocUZGUGhGUTdQSWtKOEdvQml5?=
 =?utf-8?B?a09HeWUzS3VmRk5wcWJObHN5Q0FaSjh4VyszdDdKMnRzZi9rV2svdU1UbFJO?=
 =?utf-8?B?N3lWTloyL0JCWTFWMDdRVHkwNS84T3o4Lyt4dUplTkI1TnpmNmxuSG9Lb2Jl?=
 =?utf-8?B?cy9ReER4VGxHZGluZUg1cmJTYlVVUTNSWm1iZ25xVEl0M2RwMzkrS0VEaGI5?=
 =?utf-8?B?bjA0UHdBT2JYY3V0OUxlWHpNTldYcGwvaUdqWjVEN2prOGhQeDFJbFluSzdW?=
 =?utf-8?B?SmZlcE5LN2RZVjRndTNERUhRNGxxc3ZId1dsS3NqdmVSbUhCWUJ6MDEzSDgr?=
 =?utf-8?B?VFZYbGp0dk9DUG1PV0duTWViRmtxMnBCZXpPaDUyOWU2dE50WFNVMEc5VEp3?=
 =?utf-8?B?SHVzS2pLMmFqdFNtQi9jeHNCc0V4N09mQVlwMWRsRXB1eVczaVJmRnlhTm4w?=
 =?utf-8?B?ejJpY1ZYdDVyL1Q4b3gxaFlhQTdkNmg0MTBWU0kzMmZ3enJ1NFFDK2UyaGRD?=
 =?utf-8?B?cG9SVTl2WXh5L2ZQVlZYeTZ5M3YvKzNtRG1XTXJIRERJUlU0c0gzaWxMS3cr?=
 =?utf-8?B?VGx5eGxrZ3o2d21zcmxTM25HM3Z1WU9vWWc5endTaURpWFduMiswb0ZYaTV3?=
 =?utf-8?B?TnA5c05La2d2NThFc0JvbFk3OXp4cFJLNnczUG5UU1lpZ3Z6NnlRak5WTXlL?=
 =?utf-8?B?K3NBY2xrOURJUGt3SDh1bWdiYVhud2FISWVlWHBoY3A4eUE1NTVqRDZYZCtM?=
 =?utf-8?B?YTVyRUUwV2d3TkFjTHlzZTNsWEwrczg3Mm1PL1dLRXVYSG9UUlRHTEswalNR?=
 =?utf-8?B?d04xTldrRUw5emx1UlhYWUU1VXlDQ1lUei9vWWVEMWNTeS9hV21Ta0Ewd2JQ?=
 =?utf-8?B?RTNkT2F4VW5ySWQwMHFSWjU4eE1kSjFjWklxVTJNOTlZd1IvRXA2TE1zdUhP?=
 =?utf-8?B?SnRKdHNPWTRtcEJ2MEhpVFRScitUWXBkdGttTEhkbTk3NU9PQ0gvbHV4RWJR?=
 =?utf-8?B?bVRhcm5Oa1pxTy93YTJQcmlvc1ZpR21YL1krd2h5SHFmYTYxZ1Jsc1k2UWFq?=
 =?utf-8?B?d2FQQkZPQXJzYVNhYklNamdaa0NKU0tMMENaVzYwVFBNYk1XczFyMHpFaG9G?=
 =?utf-8?B?L1ZYQnZ0M3RIR3EvT0orSFBweXpYSkdSTjdMb1Z3OUhXMUFXdWNLUktBVEZR?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zgVg11l4P7tQYhzoeR10+jvvwqOvBGsU1C3yi84gtiJ1yZuTI33MWY1N7Lmfm7A3nBnnPM09bJnveM/WPxv6Wc7zpF/p7JJEkwb5Z7pPe/CApouE6R2u5R++Y1WKuU0xFsLbqW4++eO931C5QHTNkg6AmZmPEfCEl513nGJlKxSr7q9xMxERcZNbX0Mnfej7Sqns++/4c5grfrxEq3yAktUv2Qfg76CHFoWrDhdF+l1MQq48uehiNZtidI7KmMUsoaoBGXEyZ+nXvCuDStJoV6GKc2R+PvLRQhcH0T7EKWjJ/R59s94+jYnZSiXPckgznyrgEMLJwE6Qjh8ttLyibsXNTv5pe3ySvZVDhKHT4ZEZUTAoh69Ch6fpu56xycoW3ZyZz4jw6aaabxWii6s8B6InwZOAM+CRE/9rYXeFHjEseBkX4fZDBA0TLiLOplNifM3xWpORS9U0gEpksHw12R/uGUqzflAKeXf7Wxb4mrC/J49q7IrznA00tWb4U5WiFdQSiDmx7QAQvU6ZFpKwxh5owa1yA360tTsHQk6orgqgNCWyB09lkChB6tJ5lkHwSfSfOYEhsmG537nGNHP+HwamU8Ywwd+rc14hRHJhTWY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29151e76-e219-4b24-fc06-08dde6629916
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:42:10.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCky9u1F1L09dqF9YSx0xBDBOWZze9x/l3R3t/Qii8TjlnC264yIWTeDNkBB4vbeOIkTbQRkXezS1mosmJni68HdwX3VsIFsxqTggfueWU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508280156
X-Proofpoint-GUID: MgG_yI8jci40aTsx5JQhI8zhuv5lAikk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxNCBTYWx0ZWRfX3X/8Ilu4wat8
 sswDULk0cFLNwxSI5O9iroWQZBovnIGJSxvc89Per8KLVtlOmCo0e5H2B9ckDFLTyURcy/6tGdZ
 ANctwQgt1a0WxHPAVfjt04KtTmB+xqz3CKvhM8v6EqfuZxPBOEjr4DSWrlwo+Z5DFbfcKaUWVtU
 WNHeWo8nEqeei+/sxx5qD0bgCX0jU2dadIG3Yuz2O01lCoIdm5BGxch3SdDfpC+PuyOrqDTOgIb
 o4LC7/3krKQVoiZo526PY6kAI08hsCNokiutrB1bnf7Ba0+lnXqHtSfrC0noS6NuT+EgaP5g/Dt
 99fGrsZjZgtDxjcGunGsRXlA5Z2FiYOBqYQkhuM2Lpe6PkA6wYrEsB1NMGsgmEB1k2G2v52OBMi
 uGp1hFP4
X-Authority-Analysis: v=2.4 cv=FtgF/3rq c=1 sm=1 tr=0 ts=68b0a30a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=NUZpA-ScuOKnz3sFigIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: MgG_yI8jci40aTsx5JQhI8zhuv5lAikk



On 8/28/2025 3:53 PM, Michael Dege wrote:
> +static int rswitch_get_port_parent_id(struct net_device *ndev,
> +				      struct netdev_phys_item_id *ppid)
> +{
> +	struct rswitch_device *rdev = netdev_priv(ndev);
> +	const char *name;
> +
> +	name = dev_name(&rdev->priv->pdev->dev);
> +	ppid->id_len = min_t(size_t, strlen(name), sizeof(ppid->id_len));
> +	memcpy(ppid->id, name, ppid->id_len);

Please recheck here sizeof(ppid->id_len) or sizeof(ppid->id)
it currently uses sizeof(ppid->id_len), which is just 1 byte,
so id_len will always be limited to 1.

> +
> +	return 0;
> +}
> +


Thanks,
Alok

