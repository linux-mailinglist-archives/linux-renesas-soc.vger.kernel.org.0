Return-Path: <linux-renesas-soc+bounces-17629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE40AC6AEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 958D13B60E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C45288520;
	Wed, 28 May 2025 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzYmNNTg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C703C28642F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440020; cv=none; b=jrJ8tZYZ1gXIFq3cV2nNdz+wUigqnn5vyvhkYegt7yaxjFokyCP1qG6hb1Bev5GmIaBXONozIg+09Zt5U6YffuTHtlvgU8fYwAPy5Dr0OvacmqNANmbDLd26JaTEm1U8JyhJxae1eKQS1oMhZuIyDjmX9J1R6jQ7wO3BXnUSIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440020; c=relaxed/simple;
	bh=RBVICSM8RX282qeCWOc/Wd287XW8yna0X4/TtLvIEf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLvzn4cOMYGzrqDkejQmFHgD3UoFukdtLCN/dywwQTHAD9EoAsQHyWGX1+lxUmvRZrRR35y5O5XHu7/hyEqN6AJgw7DwGNtZRGSUSMBzz7bXvaKtBeOTL0x2wVqbZH7603Mh3/w/DfbM06dPblQELcs4JeOS4CzDfUfuGjLZP30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzYmNNTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8bVua001593
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 13:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5hzV+dhuyMo7C+u+YPUX5zpP
	lQzTgz3llouJ+CsCBVw=; b=fzYmNNTgwrqs0DoPvI0SKeeE3FN8BfECbJvsi/Z0
	uH7iK415EphqNWCfHB5TRcHFrkbN7nRluHqUOU8QEHi0YwxFE6feQdPTqeZ7Xxgp
	NQhQgZ8m0PEhoIzygOwYGNjhbSbDOMo71rbs9Bzo3UdHLXB+sSvj+kZStzHFRGTF
	d4/wEcV8cpRYPFEd3HRjLtP0uoVL3qOX0kb1V6JJ4uImYJwWuHzKNjPlX3zf7H/X
	ANwNfNbKPgHDm5k8Laea/91SWlDCaNF6a8twZo4xEmdr9k0bKaocMDKPZ2U/x/Jz
	lvQibPYNLzdbZ+RhisoY4mwSgZ87ZuM/7GTdELhKsJtdHw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjte81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 13:46:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab3aaa03fso28612416d6.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 06:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440015; x=1749044815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hzV+dhuyMo7C+u+YPUX5zpPlQzTgz3llouJ+CsCBVw=;
        b=xJMl0nN+nRvCgFDIfcj7FMBNxEL1Mfwqg+LUP5W3siTGdFW5inFzYYpoHC0AkHtz8z
         SWlGAj+aEUeGHtCI1/EpAuLl27Ac87p+Ru+gijVRidRhes0nrQBAxjl544yM3k4+VcYo
         6qOGvcpTmUCIadVHfvsfTpm9AzzN/ZQ84mJjT1WEs0Y0OB2yhqjjACmU1lLUak6LwJr9
         AjzPAM7ErmewZANTZNphpZowtI76dgFd5vOYmzHuGQlcNn9ZeKPf8eAzZc+vXN5HclH5
         q/UNx2UU6QHhoPYaBcES8j3vBQBjvTUF/wvPgCQLjOTD4NP+IT2CbI5N/vf3xtjnUPOM
         buCA==
X-Forwarded-Encrypted: i=1; AJvYcCX/fCIane1oRPnpfFvKD1fmwhbIewOgE7hbADJRKOcNF9LORLiMlOznG6R8qdG1PkfM2d25lI2BhSM39SEXDcFLwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMZEShhb798RaXd3tTQFrwzCH7cigDK77rscM+V+0i8AD/sY4i
	6B5w6nJccjkRuGCPM8V4x75VvCTzoILV3yUNIVDrY+Suan2TlbM8tMTIPnevnYDJXsXOo8Ut8Yd
	cPlk6eHLV7xnkFXD0fsliu9BK08GbDyfkp0PyYZKJ1Hx6g7l3D8xlICYNfCK+DBZL92rAi+cHUw
	==
X-Gm-Gg: ASbGnctFaHW6i36uWxeQPnCluiGEznops7Z9IU5u6Z/58uMxEy5Mjebdh18R2lgB4pM
	309QeVV2ijAp59NTdqJ8o356wi/smAyGnv38jTEYyylQtP7TsmFu45uBUPmiAwPrXSPzMg5vVMk
	2MAhLkfDg3nIMx+jPdjOrdsD1KgOexfku3Y6tDA1xxOFGQTm0yyF3j2nBHcFowSMCbj1JGVynYt
	Tblgqf/TID8Si/q1acYv1WBfDrw49qX1LDR6Aba6faWfJfa6dX1maedt/bzmm4ptClbmDJWYR6W
	dmda1tppe1w2H+xJto6Z6KRLK7gAleR1C6teB4K3QkGgRWpS8yARgIEAoRHfhqap3LQizb5lJcM
	=
X-Received: by 2002:a05:6214:2264:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6fabedbda93mr35115126d6.0.1748440015384;
        Wed, 28 May 2025 06:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX8saC8JowDgKFJqADUdGr+8GS/y//V7WI+R18oHaifS73zDbALgMCfKIS/VbxRoERUhg0rQ==
X-Received: by 2002:a05:6214:2264:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6fabedbda93mr35114386d6.0.1748440014911;
        Wed, 28 May 2025 06:46:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f62b0a8sm294266e87.82.2025.05.28.06.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:46:54 -0700 (PDT)
Date: Wed, 28 May 2025 16:46:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
        biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
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
Message-ID: <wbja4vmaeqwuoyvfayra6tzik5n477yqaq6v2dmasgtvjlp6wp@bxccfh3hwc55>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683713d1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=mDXOUA0a1PfOXZ9ygMcA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: _-MMdGDcbAEHpduwPzQPb7iraisb32ae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMCBTYWx0ZWRfX1ofrFSG73aT4
 WBObtXAofxyPId3GwMmpEXyi0QOOJeA8EEztL6HBJEBgTLvoWWi5zYSPVyuu4Xf+ona/lUroR3G
 +uIB2yLfRGxeUfr2FKRVsewhtuu74s2d9J4h8/877BBmvlKshT1IZLlLxH5EclUp+YO2SMvVsgW
 JCUbAa6bS9tEeq1lBmRcdF4+fzMZEefPI6q039kVn6FJ73xWT18uy6iFBsdYWQooYaFG6XSETC4
 DoXKCX2O+cwlfng0Ds6kYxa0Uo0X/h6z1kbyr3gilD7aCkxeLYx3Rp/e3WiYl+JrPdIc7yYOFmy
 3Wa1l/Pb5kEda23/en7/C5s/DwtxMeYqygx/o5F6cauKKWF/Mskdm9ywvE9G/o3IhdXaYLUrYtk
 spkbnub3ckGs3YQAwXzWYuvsAdwJOAqjwEpZ9DV6uk0ikU/kqjaSVrE/s7iAkoLG3x8lkj/1
X-Proofpoint-GUID: _-MMdGDcbAEHpduwPzQPb7iraisb32ae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=963 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280120

On Wed, May 28, 2025 at 09:04:36AM +0200, Tommaso Merciai wrote:
> Dear All,
> 
> Currently adv7511_bridge_atomic_enable() call adv7511_power_on(), then
> adv7511_dsi_config_timing_gen() that is responsible to update h/v porch
> params.
> 
> But during the adv7511_mode_set() adv7511->curr_mode change and this is
> not reflected into the h/v ADV porch regs, then h/w porch regs are keeping
> the old values.
> 
> This series fix this issue moving adv711_dsi_config_timing_gen() into
> the adv7511_mode_set().
> 
> Thanks & Regards,
> Tommaso

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

