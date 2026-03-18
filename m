Return-Path: <linux-renesas-soc+bounces-29761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIv/A2uPumnSXgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:41:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A40472BAF70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04CCA300D4E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E607D2F83AE;
	Wed, 18 Mar 2026 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aR+CPrtf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE9D267B90
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834087; cv=fail; b=UGyGXjPOYq7IyB5bp2/BZtqrnReKoXzvl7O5gbB5mMcPWVUi1rDsqvy0juNa4PJH/22s1ZfAxGIi4uXakYlCvTjz5aivWjqGiR+Ph2zUIDrg4akQOMt4zM2wi21XfJNZChPUF7eRTdhnniFD7/+wupzxxEEw/JTSP6tIfE8FYW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834087; c=relaxed/simple;
	bh=3LSxa6nmYK8gNfIOo1tnz9b/SPy2bIYw0dziDmzkTIY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ShPj/9TIqwdNplmfiQj7ZJqOFjIapZVcYiDcK6NSoyb2jLqocAArStUGuGZR8yMLChifuWL0hrvJJjvKXeXuhad+98e87idycUw8dzUbHaSdN+g/3rNbN+UPK+oGren6BvE8BMXx7qLqGLQcvQWX1hiYwqO49CYmsTDpbvKlm3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aR+CPrtf; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8E6ohzFsgKhX9fJ98gj1sdMftD0De+/Re/Wv2nyRc9QMpODVaVU/AsVH5PSTp9Qv8SbMQSSouaTEErS3/6KSW8KVfmYp22ub7tnu6nBrdFCHURYfLf8R+tiiTVFDKwI0PlzK5mBH6Lby49YfDvk8ITYSNmsXnA80u39TytXxjBpHS5ULiD2H2EK6Ykx5F2tJlcHyx4MkM3p3AqXmbeUgfXRwqW82hQiz7Q7KpVNnINLAF1Z2+Rd8NazHZoqJJwyNDeVRqWUJYi73QgJlISP6y43ZJv4W5wQEshvOBm2pc2I5kK9EdxFzSVESRQpUEQQ5IUL39uWvdeUglZ3O2w+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Tgaw3PZ/YNw5jEMNfJEpTX2xoZxXqocIX5VkQYhrVw=;
 b=EAiDlMEehs6RS/Ei1hrmLkPyU4wNLFBKTffqUNLuW9KwIkMM4qdz/AiXbmWsQlO6q3vjK8W33yCspHtyEIx8KlB8Nq4VkFOa+qAEL6AWLULhaaXVxXfZw8dCdJCRsT8cjTvbNtTmC0sMAyh3kovP3uMUg/JfsBtPOw/z02Lip13W4sndKsTpldyXQwLh8Ic6zuIJNGNGMdWLxyqbyCWcnbfGH6mduW1aTN1R6w556WkYAI4SEyG//gFa32gWBWpyS5Tswa9LqlvqQNtzv/sImX8EerMtX25KPOOF7H7iVy1D0slS3zqA5/ybfy9eVDTqKiIkRZx4qwo/6a0jvitmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Tgaw3PZ/YNw5jEMNfJEpTX2xoZxXqocIX5VkQYhrVw=;
 b=aR+CPrtfbMINc+G9e4YNWU15DjfNMYftBM3xDw7fHkWD+5WSVveC2I1PiotAoIH6wkVOMuuNrguBLqlt/qLIzOps3/zzzW19CnTznqZeCtrA1D7zmtw3JTh3LxZyQDSEhWB9o/+bmEeBIVuScXI9+TrwFYi/DBF0wH6Yu1RNQL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSAPR01MB7374.jpnprd01.prod.outlook.com (2603:1096:604:143::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:41:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 11:41:23 +0000
Message-ID: <acf665d1-d8c4-4f47-9ce2-5100485055e0@bp.renesas.com>
Date: Wed, 18 Mar 2026 12:41:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm: rcar-du: Ensure correct suspend/resume ordering
 with VSP
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::21) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSAPR01MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 37dd472e-cea5-4ff9-8091-08de84e3481b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info:
	6dMpO5DhKwsfRQoxCr5ReVIWYwWDGON/d76ipmI/xM51/xzLyxV/U+8yI1ueQXVPtiz8Q/3TROxmdgpsB+tsXij49D5W7oMs6fu/RLOcoPI/BcLfUinickry/tWgjiog12GMo1EBISbtsYft6x5RKEnGmMxgdJIApnKWRn004SUMpAPEkq4miYPih5BY9rpvlBC8tEMci6hJukBKG3agdL044cIVo3xaL2iYsnGJTSjFj3NCvfA48aGTnGnD8aWfVSIBmR/BGVDK252W88irIDCs7SjRuapCfwnsl8s0Am67vKB3otIqxgtnBGp4A5DD5NUiZ9ZOD/S2ut3UhrOYC57oxfOhjy4/Cmd9DhwzlV/WzVV6rhO7FuUBpsC+i97SesbX3LSBXj3YiiGeLtKeOlggYdzgSKgvNH8LKZgR6XOljtwZRBo7Lf1MpksphQXbovgOdlMSx4Pup4GPQhELfigLwWbWOjXnTZNmQnZhWA32Jiw2YdM8pWw47ms1kiQ3Qu6X6NvyuWePSJ9mnf6yEtMfh32VKf+tOCf9bc97hdWRppNwYiPGCzOhmhDzyePXlAqOChOpT7GwdZywsS2HhPtqRYvjGvEK+eQgBFAMU6hgyOlK/gQ5caXtKSYM6ImF+NRHH3KFObYijpIjPxAi7JHN6fa5PNe/eGzpHjqIIql3IM7jxROJrPU6+DSR3ZAHQzZRXendWwrchifW4Im5IYomPyd/9Z3xQwyi+Nf2WTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(7053199007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDRiTUpRTnNPcU1iYVNsaVQ3dnNJQ09SOEViUkNHMWJxRVgxZk5pOWkwSERD?=
 =?utf-8?B?YnF2YlQ2NmRXcmZJNTBuYXRwakVkaGxvSUNYWWFwQjdkZm96NlN3Ti9PRUpB?=
 =?utf-8?B?M05sTVM3cjVIV0R0eE9XaCtxYXh6VVVMc2hCbXdtYU5QWkZpYyt6VDd4ZTAx?=
 =?utf-8?B?WHpBaGxwd3FoMmVGb1c0YUZQeFBoanNkWWQ4SG1YVlZMcU1aWDVDY2hIdTJ1?=
 =?utf-8?B?TnR2QUxCYk5sZUs4bFlVUUpwSmJ5cHZqcVpDVXdTaDNDcFByenBMZHgrVis2?=
 =?utf-8?B?QWcvM0JmbTVZSG1Da0JlYWF5L0xla1ZublRDdFF6RHNjc25qZ3F5bWJTd1dB?=
 =?utf-8?B?V2t3ZXpvSFM0cjJYN3NQT1Vma051c0R4akk5WGx1Q01TR3E4TUhaTW5rcFhJ?=
 =?utf-8?B?UHgrOXZxQnJoUTdycDhGNkJla1hwWlpCWVNkS2RlL2xXYmVRRTRnM2VGaEw2?=
 =?utf-8?B?WGMyajdWM0pPdHRFSXNSZEFaeC9qREZsMkhUSnVybHYwYVR0eVJDaEVKc3Bw?=
 =?utf-8?B?aFdTQzQyMzYyTFIraGxBZ3g5aGc1Yll4YVdkSTFWQ1J2OGFZejMvN3dUSVFq?=
 =?utf-8?B?dFJ1SHczWHJSZEltcHUrN3NIeDNQVG9QZDRyNDJXN1IyWWo2KzlHdkZhR0FB?=
 =?utf-8?B?RHRCK1dSZFovYVVpNWt6VlVCQWdvbThnYUxEYlk5U1J5ak5EWWhnWnBCRnlF?=
 =?utf-8?B?K3oycWFBeWVuT3o5YW5hdkZ1RGlUaDVxMlB4M0Q4WjY3cW5kM3FVTzhaMVVl?=
 =?utf-8?B?V3dZUjMzM2JKRHVPd2UzVGEyS2pHV1R0R0hEMk5odU9qemxiSEJ4UDZsMS9t?=
 =?utf-8?B?aGUyWGt5SndzbTZRdll1WXlxSWFZMld3YXNjZ3YvbnphVk80VzBSdFNYSmk5?=
 =?utf-8?B?RnRBSlg3RkhWNHVScDNWd3d5dTc2MGhJYW13SnZQajhaWWV0S1ZnM0R4L2lj?=
 =?utf-8?B?c2ltckh4cGlEVjhGcEVXcHdtTlJkeGd1WDE3dFRoSEZZVmUrdDZuR0NoZmFG?=
 =?utf-8?B?TzA3aUxlQlBKNHdkWmltSHVPVm5sQlp3RWprcmtkOFdEYVVrd1pRMkh4RGs1?=
 =?utf-8?B?VkVYMmxnc0oxYkJDNTdMY0FrNlNUNWZ4VU5jRzZoV2paUGxGQVFrbys1ck5l?=
 =?utf-8?B?NElmTUVQWmpOY2tqcC8vT0h6clJIVVlIS203WXoxK0p3a1VCQU5RMWgvTHJj?=
 =?utf-8?B?MjUvSHdNejRXT0xDcWd2RjhTTHd3MzhIaVk3a3hFTHVCL3hiZVJRTmVnZ1pF?=
 =?utf-8?B?MWZuMzQ0K3VTYlFZWDAvVFNHdjJ4KzRmSWNTREtLdlVXUmxySDgzemdCVW5u?=
 =?utf-8?B?bHBiWkhWc0pYTVFvYnRqWEg1RWovMWpBK25sT2NYaURPWklKZ3l6RXVmdGd3?=
 =?utf-8?B?eUxkUXlSRkhHTTF1U3FDdEVHNllxOGVJRExBME0xNmNoNjNSVjQwOEdxa1Zo?=
 =?utf-8?B?YnVGSE1OdjVleUlyaitMYXc1MzNaaVNucjBxc1BBd3BFVjQzcUxxRm9lUDg5?=
 =?utf-8?B?Q2N6bHRkaUZaazAvU2g0a25RNURTN3NZNGY4ME82ZE9RazJYSzZ5RWVlK3ZC?=
 =?utf-8?B?bmVLeCtUUjR4dms3UEVxbEZ6Q0xDVlY2b3Yxekd0RlhlcXByZzFxUHZJNzFJ?=
 =?utf-8?B?cWR3aW9EWTVKVll6VWtTSlR0UStMd2ZWeHF0VFQ5OEp3QTZwOEg3UjVJNmtu?=
 =?utf-8?B?ai9mVmhzcktEMzVPTTE3U3VjMVZTQ00zQ2lkVEQybExwZzVscFhwWDVRUEtW?=
 =?utf-8?B?bVV5a0Q3UVRPL2ZmN2Rid2E4QjJkVVpJcVhmU05FczkwV1drK29zSm4vbE9U?=
 =?utf-8?B?NlVlRVExbjlpU3VhdGhaTjUyZWhtWTd2SGZWbm1VWjJ1UWtPVFdBUmQvdEFa?=
 =?utf-8?B?cnBwVURUNDNxNEc0eThZK3FlRVkrbnFJMytBRThmSWpNMGlvbytsOVNSL3hh?=
 =?utf-8?B?bkdBT0xDMmtqUmhmaDVNVGF2ZjlPV0R1Z1ZxbWJOSHJrWkJNVlFPSUZ5S1Y0?=
 =?utf-8?B?QUx6V3dUV2dSMlhha3dKS0RPZnIydXR3RGkzYlJZai9rTE51MEZQOWJQY2I4?=
 =?utf-8?B?SDB1WXVmRzNvcnVZdFBTN1RSRkMvV0o4d3RRWVpKV2FTTGFSRVJodUhYZ0hq?=
 =?utf-8?B?K2lrdFdtMld4RTVGNHhuNU1xNWpDRkVML1Y4b1AvaEE3eHBwYmRLRGczMm9u?=
 =?utf-8?B?Z0txQlhXN01hcVQxVVNCcHpNREpETXlrbXVRR244Tm5kNXFwek5YM2ZKMERR?=
 =?utf-8?B?aS9ZTW1RbWtkQnd2OWRZcENOMlNEZFhQRHJSblNlb0dFOW94SXJGOWRuZjhN?=
 =?utf-8?B?d2lYcGsxVXY2WnFNaVk4QTNpbnJJV1dPcXVPbG1VdWR2WjZVUjNVRi9FQTlS?=
 =?utf-8?Q?qn3eVN4qCi3SYrxvP/yPBHtHFCsOGD4MUOgbo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dd472e-cea5-4ff9-8091-08de84e3481b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 11:41:23.6254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChmmKaTjWxmt2rpRHDjXjkcicDAEN+H6a2hmC7VEL0XYusfblqvjLGxYtCSLdkAsaOvjIw/wtC6/sWr1WdfHtEW8WjxOhEfaOuObV4vDUO/LPA/eiJCqeLURf4o4ERAm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7374
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29761-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A40472BAF70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,
Thanks for your patch.

On 3/18/26 00:19, Laurent Pinchart wrote:
> The VSP serves as an interface to memory and a compositor to the DU. It
> therefore needs to be suspended after and resumed before the DU, to be
> properly stopped and restarted in a controlled fashion driven by the DU
> driver. This currently works by chance. Avoid relying on luck by
> enforcing the correct suspend/resume ordering with device links.
> 

Same here.
I've tested similar changes on RZ/G3E, s2ram and s2idle works fine.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 16 ++++++++++++++++
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h |  2 ++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 94c22d2db197..a4a49dcd8233 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -20,6 +20,7 @@
>   #include <drm/drm_vblank.h>
>   
>   #include <linux/bitops.h>
> +#include <linux/device.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> @@ -458,6 +459,9 @@ static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
>   
>   	kfree(vsp->planes);
>   
> +	if (vsp->link)
> +		device_link_del(vsp->link);
> +
>   	put_device(vsp->vsp);
>   }
>   
> @@ -482,6 +486,18 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>   	if (ret < 0)
>   		return ret;
>   
> +	/*
> +	 * Enforce suspend/resume ordering between the DU (consumer) and the
> +	 * VSP (supplier). The DU will be suspended before and resume after the
> +	 * VSP.
> +	 */
> +	vsp->link = device_link_add(rcdu->dev, vsp->vsp, DL_FLAG_STATELESS);
> +	if (!vsp->link) {
> +		dev_err(rcdu->dev, "Failed to create device link to VSP %s\n",
> +			dev_name(vsp->vsp));
> +		return -EINVAL;
> +	}
> +
>   	ret = vsp1_du_init(vsp->vsp);
>   	if (ret < 0)
>   		return ret;
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
> index 67630f0b6599..a6731249db34 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
> @@ -12,6 +12,7 @@
>   
>   #include <drm/drm_plane.h>
>   
> +struct device_link;
>   struct drm_framebuffer;
>   struct rcar_du_format_info;
>   struct rcar_du_vsp;
> @@ -26,6 +27,7 @@ struct rcar_du_vsp_plane {
>   struct rcar_du_vsp {
>   	unsigned int index;
>   	struct device *vsp;
> +	struct device_link *link;
>   	struct rcar_du_device *dev;
>   	struct rcar_du_vsp_plane *planes;
>   	unsigned int num_planes;


