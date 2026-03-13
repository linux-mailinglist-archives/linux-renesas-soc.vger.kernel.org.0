Return-Path: <linux-renesas-soc+bounces-29315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNHHDQDJs2kqawAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:21:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4CE27F829
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE494310686E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 08:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82DB286405;
	Fri, 13 Mar 2026 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1HtgXV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwlFpMnb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AD175A75
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389767; cv=none; b=DeG2vsCW4si7nXTQT34SVNl3/DHPUEYsdx89RGR+Cb6Xr7tO/MqRSAMD4is03O4YInBGXUcuK6uMg4CT41bKSv2lR75dOwmmDgvfwP81pxsAxhhvXExKObSeL0oH2MUtSMVOcFz3gqkKF9ALZhz+u0HF3eoDJTI1LVe0sxmuUkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389767; c=relaxed/simple;
	bh=cfa+DP6pi+i+Uv86d5Eraf455IdfyKUAuKmRc8fTDLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpMfRaqcBtT4hIpyseh9LLcvr4vAvG4YrIFC92X4G7ppQlXyao4Bla3j52GLy9MfJcyhAIjgRh64R8EuFG07wTjdwjsydwrW3FEd/AaZuNtaahDvNZ+ec7wjk+yU6Sr9+SGW+5qXBcQyg3xAiF7uCzxkG5YyhmKQhRZLBcTURV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1HtgXV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwlFpMnb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tZDZ4140660
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E6XQvfblihOcc1wQzj+YqUTaImL2h2nzL92tytTnM/0=; b=T1HtgXV+q8QS/Q42
	t+N2lGQhJN73Y7VPlTxLj/DDPYsS1i7Pr4dbIzePY3dKdYIuiS1EzpEC237sh9H4
	SCmTSCsaCk+7I9Je0wy8eFoX0J7IOia6llGr2fc68kqoWXxg6c/OSdF1a4IWwXDy
	B7wbbizjQp9VjDjXjb3o+OmyLfkoV4vyckdBJnEaqhfWPCYPlI8xlLtjyD80p9GO
	kHPebfwU7aA0+yZLyfcHSFDCCRCym0XFFGziZ2XwikDok6onuYv7H4DdUKcbOrG+
	o3I99uLjyGS6WWAND1tZVqZZV+Y0IF8Xu3ZPY2vZeigd/fnpfLDtsEKH8IWQmC9r
	aL1sqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn28qd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:16:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd85e08fddso1862272485a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773389765; x=1773994565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E6XQvfblihOcc1wQzj+YqUTaImL2h2nzL92tytTnM/0=;
        b=SwlFpMnbIiVdnojVKYmj0NYWyl0734ZVPZcjU3PUtNEHIm6lZ8A+Tty1GA+8uwsUj/
         srM0IFoD0mXPpnhPCeF/pzc9Ns4NV8E7RTzTjN1QAofckFZBVhGg9e4jMN/fUI1w1qYm
         4FQZnI5yepzYNm0ddV2ykagFrc+/znJdZ/wxogieYheEIi2CNVwqDd66uXI+nSP3TSD/
         PJ1/j3vdq+19DJ5opfpShRuYxjsUQwFaZclEOBmAP8Z/rmo2rMqyazMFts5WxsV+dovR
         r2VwrlqOGi2H3QE1gVXAGNAVq6+1GxrlEKiAZk7OpflSRHVaPl6oTzDUnGWtp5wZ8dVA
         +2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773389765; x=1773994565;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6XQvfblihOcc1wQzj+YqUTaImL2h2nzL92tytTnM/0=;
        b=gfSmKR6KXxqBpAeIwAWoXZzEaYANeKxE0Du1Z3wfDJAna5KfCd8JgkA2w8vIrn/rxh
         JHOAtR1RJGxWg2qs6Pc8/xIgVPedJkM/BtRxQfR0cuzCZ/G7WDkdKppnYVCls8ZGLnYk
         7SXwUU2utfkqCvO2WOB9Zmx73dcDE/XWLuaCJZ+tQ9IA5NKE/qYq9dJCyDJvRGjYBeVl
         KALtYGtzJVNggMcaNKWAwrCf/yHKyE8yvbhnOoiNbOqgjd0MOvWG5k2EFPsQe+Gzs+co
         nh61JBeHH52gX9k4CYJCBYYxmRzAOPY04SB0Mmy1DuRUriNuOEq9VEJ1y5UoKZImgeNn
         auNw==
X-Forwarded-Encrypted: i=1; AJvYcCWq/islt3KDi9YC7j7kY+amxEwiBmPlvUGcOQGSI+2G2Z9C59NrHRPGdIIzMOrpUwBmwkX+wG8GOXk90dWkhbWJlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQFtHf7sKta78RJMM/FbWlM7rvOl+4OCrj1etjnF2V4QSeXZ67
	JfCZK10ElAiYBrvWSCwp9Juxm9kfgirWGQXEhtJoHKAYrm74iK5p/waDZDyBi6+01tRyobwPQ6n
	xaE50c81wHRNsTIjHusjqy76HfXlZZbOESg5fVc1hOKevbhfMMziSIMIGIYPFz3H0weccu/Aiij
	zAWNablg==
X-Gm-Gg: ATEYQzzV9ozEyQL5qD413cfREBKCCSn9kg+cJN4f+ZE0w/IKuLfbba5k3P8jh/a6VGV
	Xp79u22++LSsq3fveuCUNX1+jXPLJ0BSgR8cZUqMKVtE0yHs0uW9H56iLwsFewxZTWa2hch/PbZ
	78xpHyDJB3iN1cuTuid8uCZVlT24m3aDnh2tE2jug/zSH9jOet20QBV+AF1WMlVGAZ+98HS46uq
	E+1z2Fw+xMhwuS8IGlrD3EYHh1gt3s8+YzC8lhR8XuFi5Y8OLburXtZOfPWGLRnuIesd9XewSvy
	On+byXaNkdi5xo6//L2BMZCNJsrUF2iTaRDSjsEn9W5YYEcMBO/xia4NbrLXJcGM5e6hWZBR3p+
	y1If1jFmMYcFiGjO87BQYeGhvJHO8AZF95wtFqehRhsfdJElJ
X-Received: by 2002:a05:620a:2b95:b0:8cd:b78a:9ef9 with SMTP id af79cd13be357-8cdb78aa58dmr220131285a.82.1773389764972;
        Fri, 13 Mar 2026 01:16:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:8cd:b78a:9ef9 with SMTP id af79cd13be357-8cdb78aa58dmr220127785a.82.1773389764549;
        Fri, 13 Mar 2026 01:16:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c0b4sm17171372f8f.25.2026.03.13.01.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:16:03 -0700 (PDT)
Message-ID: <dd927887-bb19-442d-9ce4-d80f91d88fb4@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 09:16:01 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dt-bindings: display: panel: Few cleanups and fixes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Artur Weber <aweber.kernel@gmail.com>,
        Jessica Zhang
 <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dzmitry Sankouski
 <dsankouski@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
 <177314934075.2052605.970030122356003827.b4-ty@linaro.org>
 <95ac5123-32d7-4e87-825d-5ebb424e2641@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <95ac5123-32d7-4e87-825d-5ebb424e2641@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A_ROoMBuV3LejCAsECnBLc65rV-7kN1f
X-Proofpoint-GUID: A_ROoMBuV3LejCAsECnBLc65rV-7kN1f
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3c7c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=5EsEI0ad1I_aHy4ySaYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MyBTYWx0ZWRfXzOkIddrZAbaQ
 MhmThF3iGqzXxjGhMx1iHkp47ohxHCkkiZUAx60YM4iXe6qvM2HgrYNGhUl1+X80yj3yYWNgub8
 njMxvZiDat2xWG2+H5D+1rv6lmC4OKg0SzhkarnZq/5991uZxWk3D9wAIbwNs376VDJRItGagaX
 CnxskSkezQnV0itMPNZy6ffzde90QvhOAZE6C1gt41/P0FWsR2p8AauPMdNRcZI6YDZD63bi3Um
 mhOmtDNgUCYiEHU1j77QRfedZnPO2g2e0vhiPF9x7tGwuAE+/aviHdjWjYdUkt+RQnQDfruAfxy
 2qDoMlydLX33DFV2sF6qyZE0lLq5fMnT2WZQYgL8P93M7BSkfhVVWvFJENcDNwIGc+8ZBSrtsNr
 gZGsxD9wGJbWSxhBBR6u5pVXBEhWGEWqqr9FRMCnjVlbGgIq0MbvWI7vcdZQBPukZBBW9IldpW/
 wFd+zsH07oiVaoDGycg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130063
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29315-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C4CE27F829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/03/2026 14:32, Neil Armstrong wrote:
> On 3/10/26 14:29, Neil Armstrong wrote:
>> Hi,
>>
>> On Fri, 06 Mar 2026 13:02:53 +0100, Krzysztof Kozlowski wrote:
>>> I would expect this going via display, but that does not happen often,
>>> so Rob's tree?
>>>
>>> BR,
>>> Krzysztof
>>>
>>
>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
>>
>> [1/5] dt-bindings: display: samsung,s6d7aa0: Document port
>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1f5a1ebddc170197348d203b11a05799966dbef6
>> [2/5] dt-bindings: display: innolux,p097pfg: Document ports
>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/32003681e575a9a02cb6814e99157dfab0b9f70d
>> [3/5] dt-bindings: display: panel: Drop redundant properties
>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/72cfe73347fac6252ab77d8dcd405f0a5b1a5a24
>> [4/5] dt-bindings: display: panel: Align style of additionalProperties
>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/66b0baaabd35d302698d0a2c98671bf4e1b87f92
>> [5/5] dt-bindings: display: panel: Align style of "true" properties
>>        (no commit info)
> 
> Last one did not apply anymore, could you rebase it on drm-misc-next ?

Sure!

Best regards,
Krzysztof

