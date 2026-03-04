Return-Path: <linux-renesas-soc+bounces-28752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK2MESf5p2mtmwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 10:19:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2AA1FD77B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 10:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32E9D3012E6E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 09:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459B1390C98;
	Wed,  4 Mar 2026 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuwAzi+F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPqHNVpI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7295D38836D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615973; cv=none; b=N1IlVJk1JYp6LQq5KaBtvsrB2T9yOgUEgKVPhyYV3tzlhT8C68uYrgJypHE6U/C1cPc6VuIGOIYscrPQ0QPUwU52NiHc1iCjklipBwcXUcRdZj5TW+hYJCuJgSK2RXU1IoPQsb+0Fw+U91jL4DF54NFXL8HoZpL97yrZm5cv+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615973; c=relaxed/simple;
	bh=CgUIX/j8xbNBZepU+kcoSbBhv8dHEWhS+UNWzvSI4TY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFcCg/QMieHmd4W53qxYpoj3uAreB5yrPP/mNw+ggspX47Eo6JA0nA8GWHUC4GjcvMw+r0lsRcfto+PnElY2+g6ZKaO7uopaIkJID+NCksj/nl+9Yi0TMYnJAvr4b+kmlReulai5kgxXGxGGnnsyc+hzYwOVkhVoQ/wDDwuugiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuwAzi+F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPqHNVpI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SUOr2861188
	for <linux-renesas-soc@vger.kernel.org>; Wed, 4 Mar 2026 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=; b=YuwAzi+F4fbeBVFB
	iREDt9xOK25QxQJrQD9qQLEEn7kx2IJoRsk3BfYgaRyb88tda99pF21X1qL7flJU
	B37R1lKTaD6s423Pz2yvng3ji646s54i1y01ONE5m0qTyIAMDPkS5Ns1sS9uL89T
	/dRz88Y/PXbreMlfbaR3yuhJ3svEX2/6P5MZkYjQIvuHJ+bIIkftl8UyKQO02TNY
	AzK+ubTyRCCYt4FYGWXG656WriKN4Rq7MuuvKTc10kgV64qh6439oWyGUsfDGgeB
	a2+QuynkoYxCj4v+hAMXmQs+/JlW8XFO4/ktDxvKBF4fGvi+cFKMIQm01XZbHfXW
	5r2cKQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9kb29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 09:19:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a012f8ab7so17808186d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615969; x=1773220769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=;
        b=BPqHNVpI5jrQXhlBuFJjv0QZzmUbTXxpRVDxAiLdl2O/bs9Vcf9ZrqLfQjgsvG8KoI
         Pzo4Y07zPZz6Y0a96gX4S3pfTlOCrCLZthc8TAtY6Y4yUbKgRnQYUsfWfG3+UlEMy+4N
         iRhZm7OUdLD60YG2a9FakfQ4D80Ju3/uMppi8za92V+/GebmGHptk5j1evnrNFoEqYuE
         uidy08KS58xCg96ajjg92LsWAuNwd979T5iAk2M8HhdeaTqT+G2BN8vUZKl/VwxWFWxM
         PKfXoISs7VV2QPaoOP16T4wXzrl08SfeXK9LhP8WD9xS4TLrFcpgD3KUxSQzBNfBb07D
         xGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615969; x=1773220769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrXi13Z30e/iaNuSMOSCmABJiJllICGpM6/FbLGTct8=;
        b=v3hT6ata5e/+Za06XQ3b5o+H49+Ic+ybrP5F+ErP0EXLuzfDA4BcW9h0EBbthJEgz+
         saGbNO12R2EsEReJWzEWlI18pyJNEC2ePyv7+dbDXPuQiIrhQ2sUBv5ak8IthFSHbdE3
         IkcK+ukgjtmb9Bq8VCoTbyD8uTie2M0zR4XDN3XF3OPGVmz9XxCTHICOONIpi4FQkSQ7
         RPxhIlDgYbEwNOdbyFHQk0AdRMHoN+KCb9+ylz1v/bxJ7Bd5d/ckUUm8RABDol97q6iU
         +WKISKcjGLXbJFdiU2ShA5TuUTgduHOSUpPV9KYLeMCpvZxir98MXxkCm21SJJ7qHM0q
         NJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWhkBRglOdw5AhtLRhYuIxn3HLLiOf3DOQ6hm5wGw++Yz8HVuIKTNnrYCf2PyD+D16+KcSZZAy/5iPankbtTmSKiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9rCK917Bphvzo0z4qjEdBLRo0YNWKtZRvzkU6r5AbA6hivtv
	BjSYCyWFko/RP3NtY6ppcXDzYV0Mp4S2EbzRVWQ4BvhzfykB6Ci9nySpK9lRbY7L2ZSNq2fFpG1
	wIR8xFUAFxtjbImjEGqhKQypsHxPMrA78BKdC0134h9PGUl6zoHjory7yaWgpF2FEcAQ+UmI/7Q
	==
X-Gm-Gg: ATEYQzwsQmYAWEHhkznbFJbA6Cy1XsGJr6ya5RPnIdUrLWO6uFrpVegWNeS8zgu7Rgb
	gANzB8eHf1iNWwcMUXG2XeMqFpCUHezf9unoSm/C/DLCopYq4zVvAuZAvP92NDQU/y1PDufLbKE
	swL7kQr1jQVtHBw9bVTdc1jnxPwQIah0oQixMgmg50GUCiNqGtTCFA/Ly7v3c5KQhba5aeck157
	ydJri/CXhdB0KW21n0DCtFO8mo+gzDx+2MitbDqBpqpDUWhZ0EdlQT0rUA8d+CKOfKpufbRnUUm
	39rtg7+mZ6s/Rg9AL8HxyuhaGSiEEUZE+V1GK23Fz1LavC2YsiyAWN9y0tZatQDiWu9oTf8VNaL
	tuyIQYBQYrE47ZuniQ8gawYBbdYWS5Jy8C3GjTidY7/zBgGO7cz7hjhyx7EJzKPXzcbveddjd+j
	FZD38=
X-Received: by 2002:a05:6214:8090:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-89a1998b809mr10047286d6.1.1772615968865;
        Wed, 04 Mar 2026 01:19:28 -0800 (PST)
X-Received: by 2002:a05:6214:8090:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-89a1998b809mr10047116d6.1.1772615968446;
        Wed, 04 Mar 2026 01:19:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae613ddsm716364666b.33.2026.03.04.01.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:19:27 -0800 (PST)
Message-ID: <e2fec324-c2fe-4055-82d9-f5c6aaef420e@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:19:26 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] hwspinlock: qcom: use new callback to initialize
 hwspinlock priv
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
 <20260303192600.7224-23-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260303192600.7224-23-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2OSBTYWx0ZWRfXxrj0WMKMJzqP
 +0IdkjxtT1p8X4JEx5hmGkb9C6ztkrXC9ZIjJcm/QX8O6L2FUD6NvKDlZ3JEdimU0dDZA/VhW5b
 Gsqhd/saP+w5fxm0Lch+rtzsb2yKgD34A2N0S8X8OH+1SgwoIc7oOLDZNi3gtFsvuRjrAxNgSK9
 PIKH76D7k4e9CSIjh8QyxWrZwctcHipuLfBDvXTHi0P8SQ71uIfx6pV0aUoVt4yf3L+ozgdmuCp
 saVnkKFfcw3PfpzvYvatHsA9iuuAyZieFnaVoER9BmgwQnpodpTSFHEQgb47860sTCbDxzw/qaS
 f3nuhi3V/EVicx0YAcq8Ql5MarwwrQEabxvJnlZm6yhi15BFPFlTehv6AYH1c+9KkaGlIEUmTc+
 zQl4XdsDIJJ2guWpjnAXmKxMOtmS4aM09rCJIXgy16TVLNF7qCGbQ/s7QInvgb4fSSRyL0WPmYT
 0qhoHe6RwLcCrQQfjow==
X-Proofpoint-ORIG-GUID: Ld4jGHlrP_Ip_5-BXOU2YNGHHabRz8cf
X-Proofpoint-GUID: Ld4jGHlrP_Ip_5-BXOU2YNGHHabRz8cf
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7f921 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=7CJMOFuoybIo_9NlnXUA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040069
X-Rspamd-Queue-Id: DC2AA1FD77B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sang-engineering.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28752-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 8:25 PM, Wolfram Sang wrote:
> Apply the new helper to avoid using internal structures from the core.
> Remove superfluous setting of drvdata while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

