Return-Path: <linux-renesas-soc+bounces-17630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1276AC6AF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC2A3AEC81
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0025B2882A1;
	Wed, 28 May 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8MzSD6n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CB288520
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440170; cv=none; b=gSHB3VrqzD1WZgqPGgsoCCseS3WWkfsK4pUfIwK4gnRG11nliL8xKzNcd50hODWoRFVR0I261Nlo1yzi1CzUyN81P1vovsuG6xE/26PboV+Wm+sqTm6qouPLx7T1rCPVgxiEc32R2tkH+3MexLcyUjZCgjoE2QZMFe7piLpHuG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440170; c=relaxed/simple;
	bh=ghaXBE1MgUHH3Jlnqhk3hqjJWrRd4NAWpHTaQalt0HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BbMC3JmMbMJ0Vzt8/tCxFJoTEHIoBuFiMnCV/6nz+oWuBlspag0DZ60LJoeta6sPzNgUKl2tG122YWA8H0+tOfcRrqPsUuYAab2PdPIN10QJaqxuMQsVgkETzmv8xMAlT09MPNOlRoYJEGoJ9T6g17pXMK/RRuAhcLrd9Mf0exQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8MzSD6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5mse0011831
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 13:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aR8odOp1bWcix/LESz5USRpAg6qn2kdhUsn02vsANFE=; b=i8MzSD6nVRzQJFym
	YeapS9mErWPakUo/a349MpEC/gkKDj+SMzl+ehS5QHAd60G5R5x7SL0GWnFzXfr8
	AINR7hl68lundk6eiXStqVMcvLBSiXEivBvFygOYQalAEIDuWXyvwUbMzJxq4aZe
	hYokdVFaQaV1DeqjeqpZK5FZhEJKORO8W8kCm1OlgJnGaUGy+SU3IW2lgk9xOBPN
	Nk3f5t/wkOKj/1S7PyIkoOYiayOcvwwt5sVZoRORkQPkisygtbL34rMERCXcJGQb
	RnSs/eVUS/BZT+Bqsi0KGuZLTgKlfWZnsDYxm5wYboenKTE5tZSgmInoVzFQMcPw
	vtXP7g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79padwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 13:49:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faacebc952so56955506d6.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 06:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440167; x=1749044967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aR8odOp1bWcix/LESz5USRpAg6qn2kdhUsn02vsANFE=;
        b=FycIuBz3IN/V/ghj/T5dkRKdPJm/NsqJCLP1cTEOtDK/K0qIM2A3aD4nlH782O4lP5
         JWGL5cNlaLIr0OVqvweK79oUJj6OxIgqxfu/ObOcl4hexrVCxtrD3ghyrPQJdVVdBolJ
         +GT4nFXdkpmesQ5rVcviuZWjXLduWN248Ot4JAa1voB+XvOey0GmGDfssm4aPJe/o0ba
         l2OpLKFiz/U7vummR+HJCicCbhfJ/6TRZwR/0ed5vIK1eZp8l3DW4Qc+P28XDqCkVZno
         CDVlldzjocxM1mwimcg3T5IwqdiRnSs6ScoKKQZCn9cMfqG5GUQUICZaFrCFO69Qx3gc
         K2Jg==
X-Gm-Message-State: AOJu0Ywoz3c09SMysoKsB+WPaE4Q+dI38enyY1Q64958JaLi2AvafiYh
	+1wfRUP9vibzfcsfDqRSLh9kiGe5zKgL6BoNBrBi4LRwQy9d3PeJGXJEpRsSrPt69vmuGTYpEyw
	oXHpZ2qYtleUCy8R/nXzcvy0i4Gr0Eh+adnWkVdI+uKfR0PjC4D2tCkTVXHVV7fO1t5d6D813kA
	==
X-Gm-Gg: ASbGncvShTi1u0DsY5fWbIRd6ErzAndmriVRHfCEzj0BL9NUdidWDGaYq8EtOTpPwIN
	7RIAv/KfesfzDr6TziqT+HFV/cDdLtLceqaZnqSLg1I3AXuINBLCCJzgGG2E2NJ2F/Onil/0SBi
	nu6+89/jsDPxv2Ggze/mnwXVSFX2pt+A2JZSDS+hOM+uV7phrDN2giFIPzyvTmCZ8LmfqAkE6e7
	D257eC5YEa1r00Ibpl0gTsNeSZidglImImr+cIBWPolCpxB0pQgUhIeBkejl1a4F9VhXJkGKTzI
	kfEld4hMzb8VZMfnh2RRMsJFCt9/FknRa1XjHORERgI1eDHCMBav4b/qPKRQF3CER8NdB3lwu+z
	xLJAGQaq9ywHVeSvmi4ZyqA7z
X-Received: by 2002:a05:6214:4115:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6fa9cff156fmr267535266d6.5.1748440166974;
        Wed, 28 May 2025 06:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDO6tyMZzFc/D9U+K6bEzH7XCUHyfwSxg+WJm9sWUexygSxn7JoUOf89bLsbQ1ceAIxPl3Rg==
X-Received: by 2002:a05:6214:4115:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6fa9cff156fmr267534936d6.5.1748440166606;
        Wed, 28 May 2025 06:49:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a6253sm289576e87.202.2025.05.28.06.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:49:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: tomm.merciai@gmail.com,
        Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Adam Ford <aford173@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Improve adv7511_mode_set()
Date: Wed, 28 May 2025 16:49:25 +0300
Message-Id: <174844015640.298125.2461085924621609472.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 113uG09FCm0CLeFZlfdaYy1sZV-ZE-7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMSBTYWx0ZWRfX+AiyJ3lLBnzI
 IOEQFuw+8AMYmCmVHB+prMZsC5FwKX/4JqyhAIV9tBhLFSvQUSep4mS5xv1YvCmvHXSDXRVA1C1
 DsElxUcJCtSg8PEtz/AIUgbfC1vg7Cw2jeRK9gyhBIjA3D4/J8S1k14QlAEjbCkxaxSsHOARXLE
 /VJqZMw4M5iwQSkX5/Q5GxgkZ/Z24wGR+Ajur3SaDjBUZWItEvtE2oGICCwVMJ9goQzveVo6JCg
 1+0YjxfKHQckb/M3km5mmMOQpOhN8LHReLgPYP/I9isGjNvYcNykxXPAtnV3SZI5ka3UcR4+rgx
 NnsRq5LaDsv3qS5aL54HqkfiQ66uLpXpPwWN7I+VbeKBIMOdYG6WKk/JrF18b0anaf7ZZwYc4nr
 4eZ+2Z6Iq3tfbrGzACesi6tuYBzjdcuT9FO0Kc0fsv7cTnCkZbL1aksP7Fvmy4Ap7d9PyDw7
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68371468 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Uzkek4HQei2ilSC5KyYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 113uG09FCm0CLeFZlfdaYy1sZV-ZE-7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280121

On Wed, 28 May 2025 09:04:36 +0200, Tommaso Merciai wrote:
> Currently adv7511_bridge_atomic_enable() call adv7511_power_on(), then
> adv7511_dsi_config_timing_gen() that is responsible to update h/v porch
> params.
> 
> But during the adv7511_mode_set() adv7511->curr_mode change and this is
> not reflected into the h/v ADV porch regs, then h/w porch regs are keeping
> the old values.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: adv7511: Move adv711_dsi_config_timing_gen() into adv7511_mode_set()
      commit: 1f5090c4ae71d070aa9dac49b8ef3efe0da0fb36
[2/2] drm/bridge: adv7511: Rename adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()
      commit: 6e76b312a681224881c05835ed5a26e012ce80ea

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

