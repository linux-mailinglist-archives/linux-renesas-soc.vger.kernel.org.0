Return-Path: <linux-renesas-soc+bounces-34872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eccvH4o2Tmp4JAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 13:37:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D65725ECD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 13:37:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nh3Y8m0q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fP5fPdSR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D02E300CF08
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 11:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606DA4611CE;
	Wed,  8 Jul 2026 11:19:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9598B44D696
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 11:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509576; cv=none; b=ISHuI7+ZiLJAaB5qeqfpLS6S3VCgYY8T+zQp1g3phW6s8HcKoi8NqAm2h0yJuSp/RbTZDIDRaRlRbaWxWXf8NlmsOnDBjYNN5kw6b7V7kZZJgJqXdjDyxPuIUFKq2CPZ8FBlFCNyvAzcbfcBsUUAdlHeWWT+qI47R3kWdtZbReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509576; c=relaxed/simple;
	bh=1Bu2bsvkEVqEImDM1RKDkfEvjpFS0t65Hu+YiLDoIKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/LGx2e+qOtYt6QX9Nqlz4WIYdE4bLxMPeHhp9W3xIdH/bWAo1SOCAjz6VWUYZPVgC+2fqEIVVEiwc9pTrPwrjxMiANglNVsLKVoVMSy9tOMIPUBoiS5EoqRsaqB7W5NrH4uRGyfrpfpqKJgdzGPZlihXPWbA23Dm2wAkpq3b2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nh3Y8m0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fP5fPdSR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6688A8MP2222691
	for <linux-renesas-soc@vger.kernel.org>; Wed, 8 Jul 2026 11:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTmYSciHNHuBsQCBS4o6R2d1sOrn6HJvwBfNDLCb/z8=; b=Nh3Y8m0qUtuZVVBk
	lQZbqP4LbQC6FDXuTwVmg742dHSix2M5A33Fd6Dja2sCBWaPv7imheQA8oIT5H35
	4yHQ9/fiFv8OQL019Y0puFTAO1PO1Y0dmfIc0qAktC4RdjA6XfE0wfwG4dT35zSl
	c/+UE7xGkxD6V7+vN3mjGp+xw8ZYDWgKxxdGgRFFbAfts9zT92cAOt1eZ53Jc3jI
	P6b3KueZZp5rbvvdBw4mfEbrZsOtQiiFm+HFIsBZV4DpeIkcZsEKY3k7nvHWDc4l
	/0YCqLOBTtk25g8POm0RWH75JiXUaiZ8LKI1sYYCkRwPBl95srqk29NBR5OHB/rl
	x3lkfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csst65v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 11:19:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso6432871cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509573; x=1784114373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTmYSciHNHuBsQCBS4o6R2d1sOrn6HJvwBfNDLCb/z8=;
        b=fP5fPdSRftGPlng/axL97gt8xgsTxaAhacEptviwhe3oE7lUIvIgYJAJwYFbIgmeVi
         ZqO/q4b5AOMvPxrabLtjDYMrByUfGlaNJ7oFnd3IsxEdOcjutxUJYW2Nio5ByRhUEfO6
         TgPwCgq/puJQsr+dZDFLSum9VR3iyk9Te47brB0xiEmaTYEazeyLTz/0rKk0XAsu5Nuw
         quCJpF10BMRZKWftSk33RULG/xiQNGfykbUrTyJCsreDOp7H4wmo8bdaGOQ5u6zsbem7
         UtVGcJWLhRub2ByHJ6Avq7ixDnOReUOwPp38tv2ne+I5ua2MiMP+99HtDi6qjnOUCIlx
         oxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509573; x=1784114373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTmYSciHNHuBsQCBS4o6R2d1sOrn6HJvwBfNDLCb/z8=;
        b=p7P1zodhPBhlBI7Mf3TM70n+xo5AEvLmWwV7cDlqiRbinztjhYI3pnIVIg2VKDDcIU
         Sqn2A5U65SquAQqzDIqSMyPGxIoZBWBUIgWDMlP6fDAktTuOJna998dZXY0LwxbDpNFG
         0ZoVAEyXYe4oEBJ3PBn5E5LHT1lzHKrcDU+q06ZoFKvq7tgEaAOj17OBta8uX9YaHNA5
         hqcqTUg4EAgjgLADMWoKkOD/ksgu7o0mBW1AOByn1/DhCni9H2yaHSX6SDI6lt9gAOeT
         9j0Xmqa1aXswwCFkkf8iaZRvrCasu85TTlMQM75QslNpyWbdtUvNY+u9aAPG05urwnRN
         Aqmg==
X-Forwarded-Encrypted: i=1; AHgh+Ronj51Jwrga3sIHfbS0AM4n8FgPwpLaz2UL8Y8QsU6GOYWiqqTvhRHyYGTyCdjC5PP1lYQYTRohi7rDyZSt2OoQXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEe0oaDE7x1EZ7qgeGpk0936fqlw3IeLXwJPgPqK0PPpaETRf1
	6vYf7O69VaGBycvCayx0t+mJyGjUnXXZXbDovo2HpR6FWI26wnTLVo4sczzjqEOC8YDhURPK274
	rKnn5OOGC6e7nkqe3rVz6whdwQRiBVPUdESFk/u4GKmsCSiliQKQ/ZI0Jj7sEkECo6NBorxNjtw
	==
X-Gm-Gg: AfdE7ckX2nagLhitB7RvuvZcAb11XCojXfRwvqAwAxOCN+NjwsJKkaXZDirNptxm2ii
	SXSNBhhABSb9cs4gjNhBKDECCulKjD4uETybPcUXjYImOOVUiHXDjiFEXNt4bVqK9F7fxJzIMFz
	yUhgkSL3Le0Ag+kZNvBkPt+3y8K6e5hTO+wPntz40kITu6a3EoPs22bmLXxVcpaU8z8kAgC5M7y
	68s7YzsdH9wJhXr8o4HbVKWmCo2uJo3Nbmd99dIFAqxR1Wg/4c9CbxmQESzz7Ukmcb69hCJ2NHz
	xJNlEctj+UEM6zfvhwuWPC1BKOPBumBIn5lJ7ExMTCeV6us3i7CS+mi6rXFqjJgyg/xv6qQhA94
	RI1/d/1VQqmY3zyPOcCqMU2IqH/aKQjNi1rfJBQT8XhllLngu0LO22bO+ClOKa2RCQWrFTZXWhw
	==
X-Received: by 2002:a05:622a:1104:b0:51c:1c2c:a8bc with SMTP id d75a77b69052e-51c8b45709bmr20330911cf.37.1783509572937;
        Wed, 08 Jul 2026 04:19:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1104:b0:51c:1c2c:a8bc with SMTP id d75a77b69052e-51c8b45709bmr20330641cf.37.1783509572493;
        Wed, 08 Jul 2026 04:19:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9094:f7db:443e:b97f? ([2a05:6e02:1041:c10:9094:f7db:443e:b97f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm134729405e9.12.2026.07.08.04.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:31 -0700 (PDT)
Message-ID: <91e4b9ac-7967-4e8c-af3e-9d29fa813fef@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 13:19:30 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal/drivers/rcar: fix error checking in probe()
To: Dan Carpenter <error27@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aj5WnseULiwgmlWv@stanley.mountain>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aj5WnseULiwgmlWv@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e3245 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=8aaFJO-Im-9i58NN_ysA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX9yh2Pj2p1WL0
 3sXvZCgbBVuLAd08INRkGUK9masxhakFI+4YkE36XN6AXlDWX19mlddG8aNSEvaBgLnDz+SD/QA
 bOWrv5vWLD5AflUqPVgp9w4HyPvyMs3+3ZIWijXuQfBRdpEx1ViwAhSCAzagYo4Gf22G0an+7Bm
 qmtdBevphB83ZyM86ZKrazmswTB6m+Y5LjwPQsXa4HbrqfkiXMwwLcdMmnAmCICI+nspWvdF7op
 F2HzrvewbkxwoHOarSYV2jpfdcFK6PYS58VTuok35xY2auMWr0Kb99r5EVSdBVQMlrscJAmulJX
 xAE1hxAWHaVaUjsOcOHFptE1JILdPbB9iHH42UKWJN9NFiW4ssuxCW23zgWQlk5PTbux29hA4Sz
 5MQk4y4tUNQIw4mYbX2e6GLNfrLUIgJ+EPXFHyOFrdDiZ8nbt+kH4K1pj3WNhkx5S9KMpyfjYTy
 aDTB1wkAfLslEwC5s4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfXx8HKF1ezp/N3
 CQ7R612A6YQynccuLn3wpUiUVCpHS9N3FYPHiA3q2u4bEb7uKvZJoIQg1i/GI4VBygyg8P+Gt4Q
 c1du9x49VtuwsQAML0eqMBKTZiXhoAc=
X-Proofpoint-GUID: UVukGTEvqOl2S8i4psn9INbyVLxqlVEj
X-Proofpoint-ORIG-GUID: UVukGTEvqOl2S8i4psn9INbyVLxqlVEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34872-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ragnatech.se];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:niklas.soderlund@ragnatech.se,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,arm.com,glider.be,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71D65725ECD

On 6/26/26 12:38, Dan Carpenter wrote:
> This code accidentally calls thermal_zone_device_enable() before checking
> whether thermal_zone_device_register_with_trips() failed.  Move the call
> until later to avoid an error pointer dereference of "priv->zone".
> 
> The driver works differently depending on if we are using OF thermal or
> not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
> call thermal_zone_device_enable() if not.  We can share same error check
> for if either of these fail.
> 
> Moving the thermal_zone_device_enable() call is a bit cleaner as well.
> The original code used a three step process to cleanup:
> 1. Call thermal_zone_device_unregister() to cleanup.
> 2. Set priv->zone to an error pointer to preserve the error code.
> 3. Set priv->zone to NULL to avoid a second call to
>     thermal_zone_device_unregister() in the rcar_thermal_remove()
>     function.
> 
> Now we can just do a direct goto error_unregister and rcar_thermal_remove()
> handles the cleanup properly.
> 
> Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied, thanks

