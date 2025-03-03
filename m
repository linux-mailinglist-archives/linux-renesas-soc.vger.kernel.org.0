Return-Path: <linux-renesas-soc+bounces-13933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA43DA4C944
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 18:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DA73A6F7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 17:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4547925A65F;
	Mon,  3 Mar 2025 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VchT8gaH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ECF25B698;
	Mon,  3 Mar 2025 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020588; cv=fail; b=sjDT4QgeGkySG/hIcEEIvdtCReSNpw7hYTwl8LxyhWnFhFb9qgMwk8Ila0aMEKx0DM+gIWFtZRPV5PW/ERSLYd1LTWNqhkXD6oNnEuoQV+Nxr9YZfY/GG7yhtZBEu9uyxH/284zY3MH43CtIK3xOurGnJJF8MTTAKDGJhj/4mkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020588; c=relaxed/simple;
	bh=cfshZNQeJbNcuiENoeVEUHqhvw7827zXEy1qvDuY5V4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cl5uhnpuwi0GBYeaxcidJ5p8dCq4W0A9u3T1coOuKk6J3vAguDCwOoNsIOlxx9pwgFkCihc7lLvsgJ1l8mLPkyZ2T8K+a8QHgmP22f91IVisFzl6tv+Q7hhhurCmr2blhJtKu4+6K2ZZp+UCerog8+xIdZge0B637WqEsXUqOlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VchT8gaH; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jctAiP7gH99o/q1OLE4FWl9PBaMugTQmOvQbexetwfFtP7UWEfj5gyjFZHrzzvPqGz1ZSHcUEMxfqmfTkr5qgv3R8unEmp5EobdsNdan7PKVFRlDC/in3di5jG5Mfg/kap1y2sjhnHK6xhE3TgWpHhYUIrfM9HvuJAtOWV6siY/Bg7/6P/mGwM14voo/qaRZoF7YEdGGMya3yDW9UASqKqAYmS7bnGrEzmmCHf/zGt70wgWgM7K4obwFiJFZsSwLNw7emW795nXSZHqKRuJJX32XAmvqPjSQGjDv9IT1pYwtQdTf6l8yesk76SHqJbDhjf1yaPK4nofuCmdIZnY9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfshZNQeJbNcuiENoeVEUHqhvw7827zXEy1qvDuY5V4=;
 b=nluStTZBl9+LCzqL18H9XJ6TmpqTh6a3ATSUxcTh9NtLSmi9UaMfMnQW5zAupKbKEeApb+jvc6wTZX2+L2f1TxRxMHCpicXSDtQFgmuNKyiqB2gWK70JRQK7JTomX44tqmd0cpEqDz2CvE5sh10UttvTN+DM7PXmSLuFbELB8rq/4e6IgPBmhMPxHjX3ObmHFT5jXN80dkvXsORzz61CZZ6yrwPGuPW1a4y1YnobaCJfwf0gHTup9adOmcOXwxLtxkSJ83JFmFGdU6ZVaHfR7dEAfIDjj8o2xiS7eyWuF5pTilR5ST2HOuQpUG0IPvf52R+N8bsli1cZPU00520jWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfshZNQeJbNcuiENoeVEUHqhvw7827zXEy1qvDuY5V4=;
 b=VchT8gaHhbmFVdiy6mPzDi26xSjyVWPDq2YDtdrAsllhVgKC3PzC5BVlQc7vpqFs0gL3YWeSwYYtAYKs3jHohACtZgKeNIqy7flT9A4/uvsl6/utVb1TB8vyf5nvgNXKiLxZIsXNUA8RrUGggBPzcm4yrkm9W/0WIoht08wFMIw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB13129.jpnprd01.prod.outlook.com (2603:1096:604:30e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:49:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:49:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v5 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH v5 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbjDDJE8UqKi48K0OzPLvPziACCbNhnrQw
Date: Mon, 3 Mar 2025 16:49:37 +0000
Message-ID:
 <TY3PR01MB1134681DFD7D96B72C0A8C10F86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303113812.88014-1-biju.das.jz@bp.renesas.com>
 <20250303113812.88014-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250303113812.88014-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB13129:EE_
x-ms-office365-filtering-correlation-id: 2be86010-e49b-4092-76e4-08dd5a736287
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MzF6T283bVN2Y0ZjVXBhVERTUGNpdHA4dTZtdFd0Vk84UmkzRWpYWUN5U0FO?=
 =?utf-8?B?VHk0cnZIOGkwbS9DSzMzaVE4SndBZEpaakZIVlVMb2dVYWllZnoydng4cEJW?=
 =?utf-8?B?Ykwxb0NSUWVQeFRocWhOT0UvM1NYL3ptN1JxMlZpOHlGQkNpcWZvVWYvUThX?=
 =?utf-8?B?b1ZXTE5BaTJxSlpQY1VtZmtCbGxRQjBvOFVUQUxvcDhya2FXSGlnQ1c2Qysr?=
 =?utf-8?B?Zmc4ZGc2bTNIVUtWSlRMVklpL0hWM25KdThmU1VINWFXWm4yaXYva3JHQ1BV?=
 =?utf-8?B?S1hWUzJBMjEwVWxQVXY5WGxaaEFLWkhpRG12SDVCNldqK1ZmSjRYbXA2dEc3?=
 =?utf-8?B?VHpiQUZTM3dXUmpwMkR0WXhZTjhZdlYwQ21LdnBpcWJFWGJwZ1ZyVGg1bkpS?=
 =?utf-8?B?YlFESS9HdjArT3lJVkEyeVByemRpc3BlKzZTNjZiQUJ6OWFBV1E1aHVINFVm?=
 =?utf-8?B?VTJOSTV0SS9XOFB0MFJndW1teTJwZlA4V1BYbGhydmMwTUdzV2crODZQVTZi?=
 =?utf-8?B?czFtQ04yZ2ZYK2E2TzZudmtoWUZBZEZyQ0dvT3VpWVZRMHhoV05WeWkxMURw?=
 =?utf-8?B?TittYkdVa3pSMWg5dithTTJhQlVyTWJpeXcrY3MrOGtiV2NnQ29odGt6SmVY?=
 =?utf-8?B?RlRxTDVkMlFDS25GZHc3QnE0UWkwWnpYcC82VTVWRExBeGoweVZFRzB6Y3hL?=
 =?utf-8?B?ZThiS3g2M3k4M0FEV0hNS2x0cXJrdDNvZi8vWkRTbThJM3hLUTBDMnliU1Rh?=
 =?utf-8?B?eUR5ViszWEdKNStNcU96QVdMeGRRMXgrUnorOTJnTlNneUk0UjJkbHp2VlV6?=
 =?utf-8?B?TFJ6OVNQTElMYlMrR1B6Zm9GWHFtYVh6NnF4MWZvVTQ1TXpPcTJhMEtnWHdv?=
 =?utf-8?B?cjY4ME56RVpwQ0cyZjE5S2FibXp4ZHdDWDBzOTArWmF1dEhvTEpQRTAwQ1oz?=
 =?utf-8?B?dW9zVk5MQWFLc1BGTHJSUnhrNDVGb3hUeGZNM3dBU21MVkRXOWlPV0UyV2th?=
 =?utf-8?B?TEJoMDhMeFpaYlVHYTVRUTlPLzlPUkVjcXovaHJqTUN6bElQdkhHVkRBVEZH?=
 =?utf-8?B?N3F5THplVG1lbnAyN0NPMGMvOTZXbkRrRE5KdFJ5eFpHOWo2ZnJsZjJYL09Y?=
 =?utf-8?B?ZkdsWWxOa1l4RnhWWTN5UUdLVXYrbWdxc1lza1JHUCtUVlBIOTBvN0JDeGhR?=
 =?utf-8?B?eEI3OWZHT1RJd1I4STIwUktFVHlBZFBlOElUREtiWS8yTkxmeWp6b0tSeDE5?=
 =?utf-8?B?a3NoQ01RckJNNnc5WUhmNmtrUlZoTzB6MmtoczMzWGU5ZDY5czFpS2FQSUFL?=
 =?utf-8?B?S3Z3YkxFNUhVTTBOejdydGZXT0xNRk5UTUVXYTNRSEtNNER3aFNOalpidFlB?=
 =?utf-8?B?ZmgyeVI5SHRrVXRNWW1FM3piSUlQdk4yRzN2bXZpK3c1VTI1dW0wdk1oaFZS?=
 =?utf-8?B?VHZyM2J4VWJkbHA2NWdhc2Q1NVZoeEY4YVg2WVBuQXJuNHhtN05uS0tkd0or?=
 =?utf-8?B?b3VIMXF1dk41WGlSRVRYMnd3OGhpcEpKeEdjUng3K0ZoY2FhKzBZR1I1SXlr?=
 =?utf-8?B?TUs5dTNYNkJhOGs3NHJZbkN2QUNvTVdZQjRjYVhwR2x1L0JyL2taU05sSksv?=
 =?utf-8?B?VC9ySVJIYy9ZSnBHOFNFQTZ6VHFPQmppekd3T2IzZ3dtS0Qwd1UrVFUwWHMw?=
 =?utf-8?B?dU9iU0ptQTJvSGJjTkhFMDNEZStxOHVucGJhTUpMY0dRbVI2aGVWVkRpbWJS?=
 =?utf-8?B?VHlhMzUrZ2EvdmE3aFFFSlNrUzlCTDVCekFKWDZkNkoyVTZKbDVBSkJxemQ3?=
 =?utf-8?B?L2w0dmUzZ0xjZE1odHYveXFyY3FkQWljWVBsM2I5TGRrZkovQ2RyL1pTbjJM?=
 =?utf-8?B?Nk9sUHZRUWxPQ1E2M1JmUE4veWN5bTE3Zk16WlRGM0tPeXZEZlRkOXVPMEtI?=
 =?utf-8?Q?gvAsHwiha4NLpeYCNzs4F/8On6CMoiSK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFZxdm85bnY3eXNUZHl0dlhGdzlxQzd4RXVaOHRDV2lhNGtmQmZZM09icTJN?=
 =?utf-8?B?OTBmOTN5elhpVXBpR0thdHNTeXR3WnA0ZE5EcHBIeDVsTjgwb1hETkxUS0d6?=
 =?utf-8?B?cW1JckNqYlJtOVNzWlMwWEY4YUYxbzM1UktyL0lKTkZNbk5jbXZpWlVtUEFu?=
 =?utf-8?B?cndaZ2kwYTNrMFF0WUVBcEl4TTV2YXBFUTVidHRXazRibTBXRVo0TEZoc0wy?=
 =?utf-8?B?TlA1aThaRTdpc3V4S3orbEJDbzhPbTdReVRHanRNbHJ3NUpuZzJIY0dHS1pE?=
 =?utf-8?B?cm9oSFE1NzhCYmpSMlpaa09IL3JsOFg5K3plTXVKcUR3TEhxaHRxUFFkOUZa?=
 =?utf-8?B?Vm54WVZCU3hWQVdlKzJOTjh2NW1aWDZwMUx3ZHdZekxrVWVQU2xKN2ZsR1lz?=
 =?utf-8?B?WFp3T28rTUFGWVA2cEhTVmhVRlVDV0VjWWNFbmsvby9aQjhZTTlQYjRFWGxN?=
 =?utf-8?B?d0tRWjFrV3JmTnN0OHAyWWIrdHFuemFUaWVlNlp5UG9UZTF4cjdWQUFkT3ZR?=
 =?utf-8?B?NDlRTDZHVWxsRGNHL2cybWhqS0RYQnZqK0RYSWRndjdjK3FvUlNtUzV1dU0w?=
 =?utf-8?B?ZlVxQ2krTmRxbDd3cGNuQS90aFVIZ0JlYlZDOHBjVndRL2R4Q1liY2xrZ1JG?=
 =?utf-8?B?VlJwa1dtbDJjdTk1cFAzc0dXQzErYlBHNS95c1V5RWNTc3o3M2wzWmhEUk93?=
 =?utf-8?B?eG16NjcyaE5hUzJyN0pXRzA2WGc4ZS9pVDVkRVhxUFZXU09JbUVtc0NjbVRC?=
 =?utf-8?B?bmNCdGFjUEtXYUZ3S3dhaHgzM04yQ0RzNUU2cXVzSW1FdnVtWEFVVkIvYml1?=
 =?utf-8?B?ZWxEOHEzVHhaL25MMGNwMW9OcGVSTEQ2YVpjc0lvT2thQXBZelQyU3RScnB5?=
 =?utf-8?B?NTF6Zk5jbTRDQ1JMcDVPcm9WdGlyOHZGdVRtdEtLdElCQlY4Zk9rT2tqMHdz?=
 =?utf-8?B?cG9oTk9id1Q1dURwaDJha3lVVjlocVliRVoxK3ZrWGJNZ2lGaE84a1pFWGFR?=
 =?utf-8?B?TFJVbUhETE14MFl2K0x3VVNrZ2k0OElmOHNaR0p4VFd4YitNQnJTMmF3enpH?=
 =?utf-8?B?cjNIeHFESXFJVGJFV1FmeE05bWpFd3ROSFFaR1dnS2tDR0ZzYStQL0xoVEtR?=
 =?utf-8?B?akFqVUQvOUl0VjN5SEh1enJ0Y0xuTGVlU1BOa1JISlFnVGIvbGYvbzZGVnVh?=
 =?utf-8?B?SXdsc0I1MnFBUHpoRit4UFMxRXlVc1VIMkpXYWlqUHR3T3k0aXkyWVhJM1g4?=
 =?utf-8?B?UVc4OUpIdzNmNG1jQmQydkRQV0tiazUvWTdoSm9CenJiVE5Kbm9Yd2s3UUU2?=
 =?utf-8?B?NGRoS2VOUUpZeFN1MEFLVU1rUjNWRjQ0MVJ2NndLQTVZQzNsejM0MVRLV25i?=
 =?utf-8?B?N250ejZubThYOVdGR0FuQVM3Y1N1Y01nSmUrek16RmpTNTJiektsNko0cytP?=
 =?utf-8?B?V3lTc3hKNUp0UkJnL2wxUVh2Wi8zWTJkQXlEcjZkeWdYY1BqbUY0NjhvaU5w?=
 =?utf-8?B?OHpROTJEMGk2VjBCcVI4L2V4aStPOW5LZXRXeWZwbURoc2Z5Z1JNcEs3cWZ4?=
 =?utf-8?B?MGVGS294eUk4dk9Vb0VMRGhSZDFHK3lSRkJndkQ2SzVjbjNnSzBoQlpieTkr?=
 =?utf-8?B?OXo5bDFWMnpuQy9COUlhUWJYRGRMNlRKZEd0UWp0Ykl2ekh2N2ZDRlk0Nzlx?=
 =?utf-8?B?eFAxTkk5T2JGeHV3azV2cHhNNnU3M2t5QmY0cjh2b3hDQkVyMkU3TmRLUlpK?=
 =?utf-8?B?Mm5vSURzN21abUhRWGdxS3hTOGEzWTFpQWFMbWFUSWt4dkZWVktwMjhkcWJV?=
 =?utf-8?B?WHlHQ2ZlTWdKdXQ5YXQyTyt3SmtubkJLbXNEa1Rlb21GRFlEWFJSVkVPSCtw?=
 =?utf-8?B?MVU0TzlqRGpwY1dJbnZTU1RvKzF0ZUN0K2xpMnFlNFVpN0JjSWQ0MUlBUDhN?=
 =?utf-8?B?NXo3bkw5Y2FwdG5MZVNtQnlPWXhYb0ZuTkJ2cDNhTjRRUFcycllFdkRWcG03?=
 =?utf-8?B?Rmh4S0YrZmJKS2lkRDBvOVZlQ21EQ21PT3FJRlRqSXlOU24zRlJYQ3BOdS9M?=
 =?utf-8?B?SXdSLzkzMnJqQkdMcFdyRVJQT3hhbFlidXdtU3VKOC9EYyt6MXhNeEc1ck1r?=
 =?utf-8?B?RkVBcnNEc3B4Z2dCajJIT0dmbmtwZXhCVjZuSjZxWWZxeWZKaDg4T1lvVzlv?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be86010-e49b-4092-76e4-08dd5a736287
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 16:49:37.7172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zr90V+tYjZ2qt2AZnCOXcuFrhRqKTZRT2eWezgC/SWxRDJx1AseQpUDxs4AhFBtE9Cj5/zPeXZiqexKA8g9QQEItnpp7Kf0qkpQM+eGK7y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13129

SGkgQWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gU2VudDogMDMgTWFyY2ggMjAyNSAxMToz
OA0KPiBTdWJqZWN0OiBbUEFUQ0ggdjUgMi8yXSBtbWM6IHJlbmVzYXNfc2RoaTogQWRkIHN1cHBv
cnQgZm9yIFJaL0czRSBTb0MNCj4gDQo+IFRoZSBTREhJL2VNTUMgSVBzIGluIHRoZSBSWi9HM0Ug
U29DIGFyZSBzaW1pbGFyIHRvIHRob3NlwqBpbiBSLUNhciBHZW4zLg0KPiBIb3dldmVyLCB0aGUg
UlovRzNFIFNEMCBjaGFubmVsIGhhcyBWb2x0YWdlIGxldmVsIGNvbnRyb2wgYW5kIFBXRU4gcGlu
IHN1cHBvcnQgdmlhIFNEX1NUQVRVUyByZWdpc3Rlci4NCj4gDQo+IGludGVybmFsIHJlZ3VsYXRv
ciBzdXBwb3J0IGlzIGFkZGVkIHRvIGNvbnRyb2wgdGhlIHZvbHRhZ2UgbGV2ZWxzIG9mIHRoZSBT
RCBwaW5zIHZpYSBzZF9pb3ZzL3NkX3B3ZW4NCj4gYml0cyBpbiBTRF9TVEFUVVMgcmVnaXN0ZXIg
YnkgcG9wdWxhdGluZyB2cW1tYy1yZWd1bGF0b3IgY2hpbGQgbm9kZS4NCj4gDQo+IFNEMSBhbmQg
U0QyIGNoYW5uZWxzIGhhdmUgZ3BpbyByZWd1bGF0b3Igc3VwcG9ydCBhbmQgaW50ZXJuYWwgcmVn
dWxhdG9yIHN1cHBvcnQuIFNlbGVjdGlvbiBvZiB0aGUNCj4gcmVndWxhdG9yIGlzIGJhc2VkIG9u
IHRoZSByZWd1bGF0b3IgcGhhbmRsZS4NCj4gU2ltaWxhciBjYXNlIGZvciBTRDAgZml4ZWQgdm9s
dGFnZSAoZU1NQykgdGhhdCB1c2VzIGZpeGVkIHJlZ3VsYXRvciBhbmQNCj4gU0QwIG5vbi1maXhl
ZCB2b2x0YWdlIChTRDApIHRoYXQgdXNlcyBpbnRlcm5hbCByZWd1bGF0b3IuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IC0tLQ0K
PiB2NC0+djU6DQo+ICAqIERyb3BwZWQgcmVkdW5kYW50IHN0cnVjdCByZW5lc2FzX3NkaGlfdnFt
bWNfcmVndWxhdG9yIGluaXRpYWxpemF0aW9uLg0KPiAgKiBBZGRlZCBvbmUgc3BhY2UgYmVmb3Jl
ICc9JyBpbiB0aGUgc3RydWN0IGluaXRpYWxpemVyLg0KPiB2My0+djQ6DQo+ICAqIEFkZGVkIHNk
X2N0cmxfcmVhZDMyKCkNCj4gICogUmVwbGFjZWQgc2RfY3RybF9yZWFkMzJfcmVwKCktPnNkX2N0
cmxfcmVhZDMyKCkuDQo+ICAqIEFycmFuZ2VkIHZhcmlhYmxlcyBvZiBzYW1lIHR5cGVzIGNsb3Nl
IHRvIGVhY2ggb3RoZXIgaW4gcHJvYmUoKS4NCj4gdjItPnYzOg0KPiAgKiBObyBjaGFuZ2UuDQo+
IHYxLT52MjoNCj4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24gZm9yIHJlZ3VsYXRvciB1
c2VkIGluIFNEMCBmaXhlZCBhbmQNCj4gICAgbm9uLWZpeGVkIHZvbHRhZ2UgY2FzZS4NCj4gICog
QXMgdGhlIG5vZGUgZW5hYmxpbmcgb2YgaW50ZXJuYWwgcmVndWxhdG9yIGlzIGNvbnRyb2xsZWQg
dGhyb3VnaCBzdGF0dXMsDQo+ICAgIGFkZGVkIGEgY2hlY2sgZm9yIGRldmljZSBhdmFpbGFiaWxp
dHkuDQo+IC0tLQ0KPiAgZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGkuaCAgICAgIHwgICAx
ICsNCj4gIGRyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYyB8IDEzMCArKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvbW1jL2hvc3QvdG1pb19tbWMuaCAgICAg
ICAgICB8ICAxMCArKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTQxIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaS5oIGIvZHJpdmVy
cy9tbWMvaG9zdC9yZW5lc2FzX3NkaGkuaCBpbmRleA0KPiBmMTJhODc0NDIzMzguLjI5MWRkYjRh
ZDliZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGkuaA0KPiAr
KysgYi9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaS5oDQo+IEBAIC05NSw2ICs5NSw3IEBA
IHN0cnVjdCByZW5lc2FzX3NkaGkgew0KPiANCj4gIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0
YzsNCj4gIAlzdHJ1Y3QgdG1pb19tbWNfaG9zdCAqaG9zdDsNCj4gKwlzdHJ1Y3QgcmVndWxhdG9y
X2RldiAqcmRldjsNCj4gIH07DQo+IA0KPiAgI2RlZmluZSBob3N0X3RvX3ByaXYoaG9zdCkgXA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jIGIvZHJp
dmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+IGluZGV4IGY3M2I4NGJhZTBjNC4u
M2EzYzZhN2FiYTg5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2Ro
aV9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+
IEBAIC0zMiw2ICszMiw4IEBADQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvcG1fZG9tYWluLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcmVn
dWxhdG9yL2NvbnN1bWVyLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2RyaXZlci5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9vZl9yZWd1bGF0b3IuaD4NCj4gICNpbmNs
dWRlIDxsaW51eC9yZXNldC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NoX2RtYS5oPg0KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gQEAgLTU4MSwxMiArNTgzLDI0IEBAIHN0YXRpYyB2b2lk
IHJlbmVzYXNfc2RoaV9yZXNldChzdHJ1Y3QgdG1pb19tbWNfaG9zdCAqaG9zdCwgYm9vbCBwcmVz
ZXJ2ZSkNCj4gDQo+ICAJaWYgKCFwcmVzZXJ2ZSkgew0KPiAgCQlpZiAocHJpdi0+cnN0Yykgew0K
PiArCQkJdTMyIHNkX3N0YXR1czsNCj4gKwkJCS8qDQo+ICsJCQkgKiBIVyByZXNldCBtaWdodCBo
YXZlIHRvZ2dsZWQgdGhlIHJlZ3VsYXRvciBzdGF0ZSBpbg0KPiArCQkJICogSFcgd2hpY2ggcmVn
dWxhdG9yIGNvcmUgbWlnaHQgYmUgdW5hd2FyZSBvZiBzbyBzYXZlDQo+ICsJCQkgKiBhbmQgcmVz
dG9yZSB0aGUgcmVndWxhdG9yIHN0YXRlIGR1cmluZyBIVyByZXNldC4NCj4gKwkJCSAqLw0KPiAr
CQkJaWYgKHByaXYtPnJkZXYpDQo+ICsJCQkJc2Rfc3RhdHVzID0gc2RfY3RybF9yZWFkMzIoaG9z
dCwgQ1RMX1NEX1NUQVRVUyk7DQo+ICsNCj4gIAkJCXJlc2V0X2NvbnRyb2xfcmVzZXQocHJpdi0+
cnN0Yyk7DQo+ICAJCQkvKiBVbmtub3duIHdoeSBidXQgd2l0aG91dCBwb2xsaW5nIHJlc2V0IHN0
YXR1cywgaXQgd2lsbCBoYW5nICovDQo+ICAJCQlyZWFkX3BvbGxfdGltZW91dChyZXNldF9jb250
cm9sX3N0YXR1cywgcmV0LCByZXQgPT0gMCwgMSwgMTAwLA0KPiAgCQkJCQkgIGZhbHNlLCBwcml2
LT5yc3RjKTsNCj4gIAkJCS8qIEF0IGxlYXN0IFNESElfVkVSX0dFTjJfU0RSNTAgbmVlZHMgbWFu
dWFsIHJlbGVhc2Ugb2YgcmVzZXQgKi8NCj4gIAkJCXNkX2N0cmxfd3JpdGUxNihob3N0LCBDVExf
UkVTRVRfU0QsIDB4MDAwMSk7DQo+ICsJCQlpZiAocHJpdi0+cmRldikNCj4gKwkJCQlzZF9jdHJs
X3dyaXRlMzIoaG9zdCwgQ1RMX1NEX1NUQVRVUywgc2Rfc3RhdHVzKTsNCj4gKw0KPiAgCQkJcHJp
di0+bmVlZHNfYWRqdXN0X2hzNDAwID0gZmFsc2U7DQo+ICAJCQlyZW5lc2FzX3NkaGlfc2V0X2Ns
b2NrKGhvc3QsIGhvc3QtPmNsa19jYWNoZSk7DQo+IA0KPiBAQCAtOTA0LDYgKzkxOCwxMDIgQEAg
c3RhdGljIHZvaWQgcmVuZXNhc19zZGhpX2VuYWJsZV9kbWEoc3RydWN0IHRtaW9fbW1jX2hvc3Qg
Kmhvc3QsIGJvb2wgZW5hYmxlKQ0KPiAgCXJlbmVzYXNfc2RoaV9zZGJ1Zl93aWR0aChob3N0LCBl
bmFibGUgPyB3aWR0aCA6IDE2KTsgIH0NCj4gDQo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IHJlbmVzYXNfc2RoaV92cW1tY192b2x0YWdlc1tdID0gew0KPiArCTMzMDAwMDAsIDE4MDAwMDAN
Cj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgcmVuZXNhc19zZGhpX3JlZ3VsYXRvcl9kaXNhYmxl
KHN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2KSB7DQo+ICsJc3RydWN0IHRtaW9fbW1jX2hvc3Qg
Kmhvc3QgPSByZGV2X2dldF9kcnZkYXRhKHJkZXYpOw0KPiArCXUzMiBzZF9zdGF0dXM7DQo+ICsN
Cj4gKwlzZF9zdGF0dXMgPSBzZF9jdHJsX3JlYWQzMihob3N0LCBDVExfU0RfU1RBVFVTKTsNCj4g
KwlzZF9zdGF0dXMgJj0gflNEX1NUQVRVU19QV0VOOw0KPiArCXNkX2N0cmxfd3JpdGUzMihob3N0
LCBDVExfU0RfU1RBVFVTLCBzZF9zdGF0dXMpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+
ICsNCj4gK3N0YXRpYyBpbnQgcmVuZXNhc19zZGhpX3JlZ3VsYXRvcl9lbmFibGUoc3RydWN0IHJl
Z3VsYXRvcl9kZXYgKnJkZXYpIHsNCj4gKwlzdHJ1Y3QgdG1pb19tbWNfaG9zdCAqaG9zdCA9IHJk
ZXZfZ2V0X2RydmRhdGEocmRldik7DQo+ICsJdTMyIHNkX3N0YXR1czsNCj4gKw0KPiArCXNkX3N0
YXR1cyA9IHNkX2N0cmxfcmVhZDMyKGhvc3QsIENUTF9TRF9TVEFUVVMpOw0KPiArCXNkX3N0YXR1
cyB8PSBTRF9TVEFUVVNfUFdFTjsNCj4gKwlzZF9jdHJsX3dyaXRlMzIoaG9zdCwgQ1RMX1NEX1NU
QVRVUywgc2Rfc3RhdHVzKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0
aWMgaW50IHJlbmVzYXNfc2RoaV9yZWd1bGF0b3JfaXNfZW5hYmxlZChzdHJ1Y3QgcmVndWxhdG9y
X2Rldg0KPiArKnJkZXYpIHsNCj4gKwlzdHJ1Y3QgdG1pb19tbWNfaG9zdCAqaG9zdCA9IHJkZXZf
Z2V0X2RydmRhdGEocmRldik7DQo+ICsJdTMyIHNkX3N0YXR1czsNCj4gKw0KPiArCXNkX3N0YXR1
cyA9IHNkX2N0cmxfcmVhZDMyKGhvc3QsIENUTF9TRF9TVEFUVVMpOw0KPiArDQo+ICsJcmV0dXJu
IChzZF9zdGF0dXMgJiBTRF9TVEFUVVNfUFdFTikgPyAxIDogMDsgfQ0KPiArDQo+ICtzdGF0aWMg
aW50IHJlbmVzYXNfc2RoaV9yZWd1bGF0b3JfZ2V0X3ZvbHRhZ2Uoc3RydWN0IHJlZ3VsYXRvcl9k
ZXYNCj4gKypyZGV2KSB7DQo+ICsJc3RydWN0IHRtaW9fbW1jX2hvc3QgKmhvc3QgPSByZGV2X2dl
dF9kcnZkYXRhKHJkZXYpOw0KPiArCXUzMiBzZF9zdGF0dXM7DQo+ICsNCj4gKwlzZF9zdGF0dXMg
PSBzZF9jdHJsX3JlYWQzMihob3N0LCBDVExfU0RfU1RBVFVTKTsNCj4gKw0KPiArCXJldHVybiAo
c2Rfc3RhdHVzICYgU0RfU1RBVFVTX0lPVlMpID8gMTgwMDAwMCA6IDMzMDAwMDA7IH0NCj4gKw0K
PiArc3RhdGljIGludCByZW5lc2FzX3NkaGlfcmVndWxhdG9yX3NldF92b2x0YWdlKHN0cnVjdCBy
ZWd1bGF0b3JfZGV2ICpyZGV2LA0KPiArCQkJCQkgICAgICBpbnQgbWluX3VWLCBpbnQgbWF4X3VW
LA0KPiArCQkJCQkgICAgICB1bnNpZ25lZCBpbnQgKnNlbGVjdG9yKQ0KPiArew0KPiArCXN0cnVj
dCB0bWlvX21tY19ob3N0ICpob3N0ID0gcmRldl9nZXRfZHJ2ZGF0YShyZGV2KTsNCj4gKwl1MzIg
c2Rfc3RhdHVzOw0KPiArDQo+ICsJc2Rfc3RhdHVzID0gc2RfY3RybF9yZWFkMzIoaG9zdCwgQ1RM
X1NEX1NUQVRVUyk7DQo+ICsJaWYgKG1pbl91ViA+PSAxNzAwMDAwICYmIG1heF91ViA8PSAxOTUw
MDAwKSB7DQo+ICsJCXNkX3N0YXR1cyB8PSBTRF9TVEFUVVNfSU9WUzsNCj4gKwkJKnNlbGVjdG9y
ID0gMTsNCj4gKwl9IGVsc2Ugew0KPiArCQlzZF9zdGF0dXMgJj0gflNEX1NUQVRVU19JT1ZTOw0K
PiArCQkqc2VsZWN0b3IgPSAwOw0KPiArCX0NCj4gKwlzZF9jdHJsX3dyaXRlMzIoaG9zdCwgQ1RM
X1NEX1NUQVRVUywgc2Rfc3RhdHVzKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+
ICtzdGF0aWMgaW50IHJlbmVzYXNfc2RoaV9yZWd1bGF0b3JfbGlzdF92b2x0YWdlKHN0cnVjdCBy
ZWd1bGF0b3JfZGV2ICpyZGV2LA0KPiArCQkJCQkgICAgICAgdW5zaWduZWQgaW50IHNlbGVjdG9y
KQ0KPiArew0KPiArCWlmIChzZWxlY3RvciA+PSBBUlJBWV9TSVpFKHJlbmVzYXNfc2RoaV92cW1t
Y192b2x0YWdlcykpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJcmV0dXJuIHJlbmVz
YXNfc2RoaV92cW1tY192b2x0YWdlc1tzZWxlY3Rvcl07DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgcmVndWxhdG9yX29wcyByZW5lc2FzX3NkaGlfcmVndWxhdG9yX3ZvbHRhZ2Vf
b3BzID0gew0KPiArCS5lbmFibGUgPSByZW5lc2FzX3NkaGlfcmVndWxhdG9yX2VuYWJsZSwNCj4g
KwkuZGlzYWJsZSA9IHJlbmVzYXNfc2RoaV9yZWd1bGF0b3JfZGlzYWJsZSwNCj4gKwkuaXNfZW5h
YmxlZCA9IHJlbmVzYXNfc2RoaV9yZWd1bGF0b3JfaXNfZW5hYmxlZCwNCj4gKwkubGlzdF92b2x0
YWdlID0gcmVuZXNhc19zZGhpX3JlZ3VsYXRvcl9saXN0X3ZvbHRhZ2UsDQo+ICsJLmdldF92b2x0
YWdlID0gcmVuZXNhc19zZGhpX3JlZ3VsYXRvcl9nZXRfdm9sdGFnZSwNCj4gKwkuc2V0X3ZvbHRh
Z2UgPSByZW5lc2FzX3NkaGlfcmVndWxhdG9yX3NldF92b2x0YWdlLA0KPiArfTsNCj4gKw0KPiAr
c3RhdGljIHN0cnVjdCByZWd1bGF0b3JfZGVzYyByZW5lc2FzX3NkaGlfdnFtbWNfcmVndWxhdG9y
ID0gew0KDQpJIG1pc3NlZCBhZGRpbmcgY29uc3QgaGVyZS4gV2lsbCBiZSBmaXhpbmcgdGhpcyBp
biBuZXh0IHZlcnNpb24gYWxvbmcNCndpdGggb3RoZXIgcmV2aWV3IGNvbW1lbnRzIGZvciB0aGlz
IHBhdGNoLCBpZiBhbnkuDQoNCkNoZWVycywNCkJpdQ0K

