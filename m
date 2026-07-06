Return-Path: <linux-renesas-soc+bounces-34741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wtegDluQS2peVgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 13:24:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459870FCC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 13:24:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Nl1v6zBy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L4TMAPLR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98DCD34635CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 09:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCE941F7E4;
	Mon,  6 Jul 2026 09:03:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0341F7C5
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 09:03:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328627; cv=none; b=lWX4SXTV5ChnVSqFHZV1Q1cyiYYgdRPmZJT6qov5PR/khmDtPfa7jO9074Wdg8Upm0qy1zCRHrNkRgRQECncgVP4UnNA+ZFancsfkLYxm8xir4W+bm9iecRDkkTbI8MdKE3yfh0ECZa9EITGFfDrKOOn0RVqAJf6XMM8YZVo4s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328627; c=relaxed/simple;
	bh=klvQOgAtljMtVjWy8qF4a6TJtFT7M6YfrjVAiyQwwnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIUy1pzD7xbjIV9izmEALR+GT8+bHFgEehYnGVZY1Gm41pQlKTkMKdTsz1Utemh+h9rfMaSo0C/uM5PZuwmOdTc3rGC1nBj1xIK6TBW23tFEJp2z1MBTAWx8/JgxnVZY0VRMOMSO8rkOC0gBGbLi7Q9uFnJDuU9R08AwbWCVS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nl1v6zBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4TMAPLR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668tk393617058
	for <linux-renesas-soc@vger.kernel.org>; Mon, 6 Jul 2026 09:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YdE3ihiImEvpnsnxDd0JAGP3wIV9I5utOIQwVGrTwY=; b=Nl1v6zByB4ofM0i5
	XZpXiJWbZ99X+//HlbqD9sd6EroBI2aNeQtwZXmnmCxkxWSVOZi2PwZOFuBAxeuq
	Y7F6n0vv6UmTyh+aLcIrlHBHyvgChlKT6ImklHmSh0sYNacOw6srgBjdjcg9ROul
	Jq2/D8+gZDm1xpyJ0N1CaHN0oPv2FCGdscIpVkAzp58TKIV8qZMb6KktiYfxv5kH
	lsLSo3lSs0U53cYBSNUsEBeNsDKAeEd9WCQP0te40yj2GXPu3wKFBBJTZjYx/s1i
	iXssfX52bLJ2v5FbQXzq4/s+YlH3qrYwzGp2tZgjRMLne5PxGUYawbJOOfawHLSm
	GEgD5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64nj9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 09:03:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so250095285a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328616; x=1783933416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YdE3ihiImEvpnsnxDd0JAGP3wIV9I5utOIQwVGrTwY=;
        b=L4TMAPLRYpLd/HSXCkwMg6ihlYMSpB3xmwdncy1A09aRdhZW5FFTcvZwLJIMlN43C/
         6CTs+PqI4KjGn4UE+/fbwyWc/tCycpRG93k9y5h4aFYJuYkHBEMs2uIPM2LKYyB6PWTH
         sttWAZWSDK5NdCjH7LhDomnGK9oDPOInQCCo59HLEDKJ0/kRXSHWSJBJrAD0jX+cj8zU
         j1Fbqj7ciDPXaqRj6OvhY6vMJmoDYLkvvaQ+w7yVkGGax88v6kl9Zi2J4kRrkIFpHcMZ
         XHDH0KaZd3LJbFGwJbz+d9HuvCwPigWrmXn0kqI1pfSGxwPnVakdAJh13g8qjrpgNzs3
         zudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328616; x=1783933416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7YdE3ihiImEvpnsnxDd0JAGP3wIV9I5utOIQwVGrTwY=;
        b=A4mSCoXd8YZYtm4DflDgvv1lqlM5NoF3lS2O9aqOixodIfIeBTIzJqYk8PoiLLgJWo
         BirhEl4q7IVwwCkPiwWpanmnt7XHuz4qayLxEEHBALSaM6asyPvmgdQ8EAxGwqci79UV
         5m2fBAPrWYek8ohbHYGr8QmlukNg20oSxQTg7Agb/okhDTvOIIaAhy5e0HzVsxsBUJ36
         X48kQGW8f2MvzuZn+Y4FxOdj/12n5XGgPn8LptY+R3U0nx13RksFE82dPKiq7WyUeytF
         +NFjsHq2DMRLOmyPg0EtM2NnTX16PW+zMOgP/LdJM9XrewsLUWrgcVrFLZ13/Nwf57FD
         M3wg==
X-Forwarded-Encrypted: i=1; AHgh+RoQxurshpG6mB7DLqRtrgal85q4fMEpirZ4lo57j+kO1MXDz6ZXuUMC+HIEsXw7G6HV8WIyx3mmBOr+I01cSq7r8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZoxMBBQPlhid6z+Z9yzRt6xoxWNEMqwIpRQbjeMNF5U3uLIe
	L1wb4ceb3vKXPJzEJ8h5AYEoHG8BK4r2DuIuiY3MdDuxuR2cLjxP+88twJ78XxW6Dw7AGLpDrPY
	t2no5XmF9RfNr3oY+3iE6xB7W3pNOkbnN1RP3Rk7uUbb+bvdm3qNb6PZvkLIsa8NMpB/QCiKBlw
	==
X-Gm-Gg: AfdE7cmyjgOWtKMDc0l0qrT0Har7dkUBICOz8Ow0zAI44wTYYcUmK4huaqRu9I2Mhe8
	hMC9oCfcG192VKPjLgpcrD3i5pC1nPQmISersXPS4EvDIsYw4GBnQFrFKm3I1MFkkP2HSv/9Dmk
	9CkvzGm9v/Pv2ADVZruJlWc/lMzCpotXiHIFyVySryEIrgmssKLwg5iWixN7OXlebBbo10IA2PO
	dZ5FwSQtEQ6GkOAo/rqmMfSOWN24zX+b+EgdrVaH2oAJUswg4mmql0mhpQa3pJX28MgrpE76S4a
	0fWXZnZTq2/rHG3ZchUeE3mAjDu/QwmNY9D5skzDlbnOsQRSU+c1GS4j6zNOT8sAtkXa8bE9bjg
	skBj8qpVKL3UsS2q1sshZuwe5mMX3QzHvhtFfT1U=
X-Received: by 2002:a05:620a:19a1:b0:915:9984:5781 with SMTP id af79cd13be357-92e9a4b6df4mr1211440485a.51.1783328616177;
        Mon, 06 Jul 2026 02:03:36 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:915:9984:5781 with SMTP id af79cd13be357-92e9a4b6df4mr1211436785a.51.1783328615580;
        Mon, 06 Jul 2026 02:03:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm326998025e9.2.2026.07.06.02.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:03:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Drop unused FILONOFF macro
Date: Mon,  6 Jul 2026 11:03:29 +0200
Message-ID: <178332860257.18708.3358405978756555451.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704151055.211082-1-marek.vasut+renesas@mailbox.org>
References: <20260704151055.211082-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX+E8jbswWRA+b
 1/w15FoL3pFnL6nzHlXKeFA4VngCrXfI97HX5L5EbXUjEnHapIvCiHN6sfK57LiFXDXBhZT4wjT
 NMJNJimpm4OqbTVutwBE4I5pDEt4cbG63YOby38D5RuGqW1DoEqJv5n0HI4jcOUZGrO7vmfB4WH
 jkUlWRm5t5xDy2Mm4LtSsSKxdrivNa7Js/8kIQhnDCq5hiQsEQuhnyRTBs5miaLqajOPNwKQNJc
 62nGcWaMNEfeGmK/ONEUti+bpW5XAglvqBxuqRr/iQZI/F3g+DgHGfKgJJkhV8nNXJwzi+ncWm8
 hZIF2LtDsgGSGOCl+3a6AkGSCZoRNxcRL1bXQ7x2LMeTz3+GuthIGuQ+Wao2SrwrASXPjrGJfGn
 W1SYcVokmHEJISDcHV1/OwEfCro/Wxc7qDOcVQZvg53SQ7tBDVhQrbcLTJuMN46jmn3TcUDGCw5
 8rHQEwxndUhGT3HoGeA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b6f68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IyeIIUWUMHWuZ8Y4CW0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7nbavryFoZtVvluvIAbrHdKNsMvF7hDX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX7cClNu7YLI36
 6bhT0HpA4uitxETiVT09OIJBnkl1zSPZw9r8AIIpV4rwYWRmGb0QaUitHuLbkCPfW6klMKwkc5f
 9TOhwS8JjL5a6BBWQxKdvOhNMea+f/A=
X-Proofpoint-GUID: 7nbavryFoZtVvluvIAbrHdKNsMvF7hDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34741-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:geert+renesas@glider.be,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8459870FCC3


On Sat, 04 Jul 2026 17:10:39 +0200, Marek Vasut wrote:
> The FILONOFF macro is never used in the driver, drop it.
> No functional change.
> 
> 

Applied, thanks!

[1/1] gpio: rcar: Drop unused FILONOFF macro
      https://git.kernel.org/brgl/c/1048d391664a5b56dc5db4a1944cde47d749c9a6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

