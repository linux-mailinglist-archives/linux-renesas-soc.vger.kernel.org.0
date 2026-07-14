Return-Path: <linux-renesas-soc+bounces-35188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MxZCJZotVmpf0wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 14:37:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECC754A30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 14:37:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pc0ZlMeE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CIb2hTp9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B33B330C758A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 12:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546B3448D03;
	Tue, 14 Jul 2026 12:31:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0BE448381
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 12:31:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032312; cv=pass; b=azEPA7/VApo8SWd7ca7EPCsIyAW2+6b/Kf1RBoh8fZuXZlW4FAQi5OZ1fYDi2CUH06ep9q+d/ZRnwq0IzzWPGAQjiE3cUO24EMPVuqvx2hxm5mMoqGM6YnByJds602WKD0rvLxdTHOLDCS8K9ArriEOHb7KHQjIMKQLr/mOIZvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032312; c=relaxed/simple;
	bh=ji3uIpmyKNhCWk9sN5ktVEemOSik2hw33b5vEOk3sQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tspif1LMkuNO3xq8qcbygDy8Pqx/RLiA+0Br5lIvORq7kzMSw0BBHaODsNYz9io2qydKMLs9lyyJae0g6wpS6W7pyHi5yiXs7G+fMXEEUs5ila0jDWldLUDuY2SLlNeXRI9szzdZ+Hjt7LEpnMmGCIXCe4zCmm84vyDqBNOwpX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc0ZlMeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIb2hTp9; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBoda5263219
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 12:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=; b=Pc0ZlMeE/Tc18FPN
	qe3RnE7NymV3SObOIc4FWc/ZMmsgt36U1cCl8yZUhYe7hZglmy8uhaTuB/s83WLL
	Kq/EvZEn+mmdnNSoFutGXKKBkqoB3Uv/jXvuBI0/yfLbHb66Ig9BvOd7EICXkRyr
	Db7oeuQkryAz6x4aGnDLAZXZrPJ7nPmQKWDcxLvuPyjFkVKK3SjAfC+hV1G9mVbd
	oOv/HjEKt4KPkVMfGzAH1ex/t//dsLNli7HfurHC+BUpDUS33YPd1js6RPv9rpwc
	+yhvdNhoIErbIlzzMeQJRzgNAcVWj9actgAwf0vlMRtNwA8AShY4G5sDGs95XVkg
	Hu2hEQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk052w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 12:31:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90410c668adso66768376d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 05:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784032302; cv=none;
        d=google.com; s=arc-20260327;
        b=CasiigWt90UA1lxJ8FXdmoO+ibFHcH8FIlnMvZGVeGmb51wT5PGvHYdC5+lYl7n3ty
         p9JtuClXPWCIpTqsLkhdcoekfmx5TCXZx8SOndUqwJcL2saq13YQqe+ehuoK1zl5JOQk
         DN6Akd32uRIrGgz+B8fL4an3DkKL/EIogiZIsbFzGgmzcU0VaTeigvv3HMIrKrt+Xja6
         rxoPCsRM/5XALlIQf4fFf0Ej8M5HGec1M59PSa9TqHK9C3dBCJjnIjhqXHwaPTm+nMV2
         LXyMWxTG6+22BAwDgUKQU0NPtXerSO850HKvJ1lt/qnb+tD7S3Y3DfL293Ena0veK5rW
         sQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        fh=N8nhVhDkf6ZWsWqMWikok7irBlBzParNroGLpukWeMk=;
        b=nptYcC+NiBVwDxhv7u9A1Gw/DHzAMKsk3oVaZHS+06POmWoE9zzpssSE1VuO58DDJ6
         mdsjLBnKGXbUecDCnjXU+XYZ/PGiBAty6PAvPwx4a6BAVf9OsLTEKzN1dorpIIjqRP2F
         CUpPv+gT+CaML1JYYZqnxHrsQ9jpZWAWlTynXBhgAaaPIGu7FXgCGPTA3DL/yLidYqqR
         x2RrE3yehXSJSWdayvrMOhBAAlN+i4sfCa4p22CR11CqNv458gCNJwWFWbVfwPmInpRF
         pRVjgZTS6Ct02robtLKh38tba0GJlnwndkQzaA7oUyqEJLHll3PxN6qz6rpZr7l3rhhB
         Zfbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784032302; x=1784637102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=CIb2hTp9sJ9LNPmkTS8PthiNnwWChroVR6yZEn7mgAn3TMVA1bNWGjhDx69l9L41Km
         GIBgFwiMvxh0oi1LmrU727+Y6mS8BPmVhdogTOBKwHxywhWbWWeD0u2sGfydrpw5Ltqg
         XnuPhL0CqSMKSdtYyFMJIxCBxJ/TuQPNKskm3lpn4fzWKLYpw4+UsWfTVA1HVIz5dDNo
         EUTgv4StgM/GC5AP0dk9F9++hqgAdCUWLYD0cCaxGRj955KvTZb9WqBgp2IVC3hwKrqM
         +Mj78sEcOWFPOxLJk/KMpJ1q8h7iSVgT6V/NeSmhfcM7eaRriVLa8YUQbbww1hMIsO3p
         V0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032302; x=1784637102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=gZ+j+AKln23eWlOA9ll+pPm55d/R7bp5PMLRS1SsMyN14DeCfy9ebosII3m5Lle/ZV
         5pBEE329KBiXy/YmDf7D3An2qMQs20i0CPQ4kT9Wfc0fa66VUfC6Rfd7yW+uoC1+bpNn
         XqC4igPfkXqRSlnIBskbt1L7nuGRehlV9xyp28CRORemgQD8hoXw0XLXE2fcQ9e25p3R
         ed3sXFtjSmoX6HFDND5XmJBZX1Al30gUptq5u9g8OYivNx0KecO/C0sdZUV9ks6f3GDv
         GuHn08tEyGiT4Vk8qwX0KjmPKnVYrY5p8Evkku7wc9TT5yIezksTuJMLWa0aQgFlyl3e
         H6Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrL9RJE7go9hfw9GMAZhetBfuO4tLZ+JEngHbUQroGC+5YHv0mqrEc37V5ZF9Eh5slRrZZG80lcnzJqBICKu2uC8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Wk5Xk7gnvyzeQWokLNBXZiedpzAhKtWUZJM+mwdkcX27uUKk
	Nv827KV/PIAY8hjNfcpO3plB8cNoRzdwxBg9nEuFsp3eEhJEk0KMn7boYpTx3Gb2lof67aB6frI
	sbzXNCWefM7dfNBSK/aQ1ZZ19mSYp1dMtCA5V5RUWRvZZHdQPdPqJ3T8e8RCsfLUYOwVhIqVDwp
	Z1XFIkZr996k11/Fvx26z6l4HrJD9FNJFVYzXo2S+pmCTFp8c7
X-Gm-Gg: AfdE7cnwNkctewWqPNcxemP1Pzv+TIdyv5HZ1wEp/8PKYfZ2V+CSY92keb0GuRtaGpa
	HjIj9bfCH8yQBjGqSqTD/zXz/fQZPpR9h9yMcR5h8FuG+lDVHiB6unBmbe6tYxIUjHokLRdaAyG
	xBl7b/CdAaplW9ho9OyGTNmo+nJtJQJQXsj4vTP8jjeFG0zg92qI4gGMUUVDCupSMyDPvU
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id 6a1803df08f44-90747d1cbf4mr35409406d6.62.1784032302426;
        Tue, 14 Jul 2026 05:31:42 -0700 (PDT)
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id
 6a1803df08f44-90747d1cbf4mr35408856d6.62.1784032302033; Tue, 14 Jul 2026
 05:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
In-Reply-To: <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:31:30 +0200
X-Gm-Features: AUfX_mw1w9aani-kekqL_J3mlM9LGY41ZFq3mfPK3ex6sNHNGM7Yu8pRBTDGFLI
Message-ID: <CAPx+jO8W3MdqnJ-4EgbmFvODuX9BGcyww=YRn=_CknohfSWOjw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pmdomain: Make genpd_get_from_provider() public
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Jr5ma--owGpUz1RbvWc1w0JReG7RU4Q8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX0SdpYOC+zYSY
 HdDN9v8xihrWS6lLJYKNQ81PyXOaH/0FGazxuhAwTy/xCsgd9ORrNkbMJOqxzSWLfJoX30yCDVg
 /JiXiaGegckgceU12LSV/WkUbLJciTHnHzahNbPH6rzDfr0L4aen9nRXQGWN9FJxgyXngD+hXu+
 DUsZev2M4debAbGp2j/i+DBYbi3hodTPFu7qZZivxg79OZpKsipBgc8uEASOrG1DhUHFhfEJ8qQ
 JBvxO3VAhGJpweuimR54kLkbXxkeWmAhaMEha9tYwwiCJPWbtlT3n+xRUsbd6n8cS6uf31YqZoY
 +euL6JtN0ZyRV1Qgq1QEssZSdb0U2K6vjViDbkxmx8wl/aPisxkcyIa4ZUx1M+nJbOQDPWNmerR
 HR0AOoTYSJXEs/be4LkyhFpGldfle1r4KUAOpqpTff7wpfdvEWJzk7v7UULqBmJXhSAlAcfH3ul
 jIlhZgaDTDj78t7YW8w==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a562c2f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=BvHvEDz1nzgFWKTw3gwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Jr5ma--owGpUz1RbvWc1w0JReG7RU4Q8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX2/ju+cqTTBiA
 ZjQNn+G25ozS/mXNjL3HbzL+Vn7B5W2o1l9UGo0Jh1vTSxR+5fx6ceh5gRUWDJCiqRlffxYgblM
 h7hZfZT3cJZVev5h8eW5avuvVz6Fv8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-35188-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAECC754A30

On Wed, Jul 8, 2026 at 12:17=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike the corresponding function in the clock subsystem
> (of_clk_get_from_provider()), genpd_get_from_provider() is private, and
> thus cannot be used by PM Domain drivers.
>
> Make it public, so it be used by the R-Car X5H Module Controller driver.

I am a bit reluctant to make it public, because of potential abuse.
Moreover, there is no protection or reference counting of the genpd
that is returned, hence the caller needs to be careful.

That said, if there is a strong argument that it's really needed, I am
fine with it.

>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> ---
>  drivers/pmdomain/core.c   | 4 ++--
>  include/linux/pm_domain.h | 7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290677c..7de3c693ddd9a2c8 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2900,8 +2900,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -                                       const struct of_phandle_args *gen=
pdspec)
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec)

If we are going to do this, please add "of_" as prefix for the
function to have consistent names of public genpd functions.

>  {
>         struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
>         struct of_genpd_provider *provider;
> @@ -2923,6 +2922,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
>
>         return genpd;
>  }
> +EXPORT_SYMBOL_GPL(genpd_get_from_provider);
>
>  /**
>   * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f925614aebdbc914..95fd7e63e87e2095 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -458,6 +458,7 @@ int of_genpd_add_provider_simple(struct device_node *=
np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec);
>  int of_genpd_add_device(const struct of_phandle_args *args, struct devic=
e *dev);
>  int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>                            const struct of_phandle_args *subdomain_spec);
> @@ -492,6 +493,12 @@ static inline int of_genpd_add_provider_onecell(stru=
ct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> +static inline struct generic_pm_domain *genpd_get_from_provider(
> +                               const struct of_phandle_args *genpdspec)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int of_genpd_add_device(const struct of_phandle_args *args=
,
>                                       struct device *dev)
>  {
> --
> 2.43.0
>

Kind regards
Uffe

