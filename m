Return-Path: <linux-renesas-soc+bounces-14439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461E2A6364F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 16:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D4816DA6A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 15:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39E818CC1C;
	Sun, 16 Mar 2025 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBfyneZa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AAF42A8B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742139804; cv=none; b=XWi41dYUZUzPYk4Gaf5+6y9ENjKYZ5xcsavtQgtsNIjL0e3ixRaL8ebvf8y7DEuEWWXorvxNVcAbZwjTkMIFc9OcjQcYbwFQiG50de0NRlGQFDiREWkXLqdVBhXq3TOaBFoeeMUlZKLIzFVMOCkAhY5PcjwQfReeb9bDWHJRAkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742139804; c=relaxed/simple;
	bh=6rB6NhnEtPbCs+IDsQlal5MewlTNYehy+dDFEmwxLmQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVInkhsOnew2wp/ht2i14PWvdnu6LjIUUv2SbO9WZu21nA0D6o0Lo3Vzna1DuDAokJsYrhsmXPJLtkQZDF0VZ0KIC3ZcJT4rURmUIYVsNSVv93wLnAvD2ovOpr3Lh36vMj6qlBvlkZUEZJwvULyIZYVobCwAQ8ADBRvMoHIeiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBfyneZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GDgcOi001148
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 15:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nTKnVV8zpjbA9rOF3XkcFyf8
	84J/ODhN0CmXOd3fWGQ=; b=hBfyneZaM9Oub1KLXo2JPnUlVMFfzqGOt1fDcZR3
	mFQvVu78ux7JwwMTWdVpOOSecdYOnkuXqyF3QlFocnk8Ds4gJSfl+7wwOT0wGmg/
	3k2wBrYJVeuNZlNobVyxubQjgvxuzbMOMSFGgjUnDitQ2+9ZGs0D6m8oNdKyuW0I
	UfnCQQs1NTToOdbZo3lk4WzTUuIlefF1U9vaDZo5cmivjKIDeqKnSXGBr3axhCE6
	M+YX9FQ2WpdJhwi7LBrt5XUflm/VKDXguvKuQIKtxmAChQURIgsIV3fFNJ5MS7Z2
	KEkIhv7UvK1P6HIlEiMeO0Mw7HMue+LWQQ31EBPrbn6alQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1x7tcaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 15:43:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ed78717eso69876576d6.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 08:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742139795; x=1742744595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTKnVV8zpjbA9rOF3XkcFyf884J/ODhN0CmXOd3fWGQ=;
        b=tymZAaNFo2ayAKS6rrILJD9v4Z6GjmtgMgpza3ZsRH/bP6ymLdVQKTMfToxBLtGoG+
         dejhXdtKJNCw/6fhANO8cW4s1JMTNqRy9NhM5+soII8QZg6qZoXoGu4YCrASGp2hXaXA
         IGBEA1WZ3GgiQTfmHG7NxPgUeSIaeCrGzlnafxlk1DqaJfJdtxE/l6RwbP7SBd6+/z6N
         v7w2IvbTLXHYeVusQAM2pcuLIKYZ/vmKrYk2uDJhNVvGsnrr8tsYKR4gr6PpMxsPlhVU
         e9uyuTFQzTCZdU/WIOEf2rUNnxHJ3AEMdbqQcaS54Kfdq6CkijULclHdTEAz1ifxBQK1
         gHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh22VMJq4Q2cO3UECOFZZZEldiPQCUT/k9tfurgh1eWnsW+7f8O3q6vHadJO0eZBdbaW5YFlK2/2xOk1ci4auzEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwT7FmwO4Kd2fEkxms5uCxhU5BjzFaJ6X0B206QCVl+4OBjIEP
	y4cv975lnLMjVuUMD+4x+5sTUcmbCSEsmUwVKNH+PL8Ym+2MzPHP8wBsqySkgAQqzXuPfiQNU61
	GSRr7sNmraywJKU7EB8jW7krzQHHqq7kHRL6psFbD/4EFX+utsxMR7NJ58oHog09nNJ3a8Q==
X-Gm-Gg: ASbGncs4vvaU/a6BWQxEq3HyE/aI7eDqWOXJxkzSq99fs3UNisUU+r18o+ONjXLxVJC
	i1s45LAGtygpB6OxXZ5xjk9bUh9cLifzI9is8fxiE+0ZRWdpB8i5E0//0nCazng9jNby1WZE5TQ
	kuWB9veiPe3coR/PSW7IP21IrwgOCejXnmoRNa69FYsaUBEt1Qg3SH9RvDZ5oc1LiYuqO8ZfCrF
	K2i5X6ZPr1b54g3sg0WOkd9VeM05C3C0K0AqMjlnD0WCK5CYSw7mel8TNH7GeHfY7yVueQxWgL/
	fHoO2kVBihZ5VM0CezjUk9JwPXj6vrrKQ0A/9xkfHGPnp5me/kFLBD6pddoYyAsj3p7lxgRKpLM
	0BuA=
X-Received: by 2002:a05:6214:20c1:b0:6e4:269f:60fd with SMTP id 6a1803df08f44-6eaeaa8dbcfmr169377416d6.23.1742139794782;
        Sun, 16 Mar 2025 08:43:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVicho57Y1BnXkMY5rcn5kz+aTOc5CkCnSLuY7XVtUqHQzAeN8zk7y/0byzpjmwxoqpvC9vA==
X-Received: by 2002:a05:6214:20c1:b0:6e4:269f:60fd with SMTP id 6a1803df08f44-6eaeaa8dbcfmr169377116d6.23.1742139794442;
        Sun, 16 Mar 2025 08:43:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7befe4sm1098326e87.55.2025.03.16.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 08:43:12 -0700 (PDT)
Date: Sun, 16 Mar 2025 17:43:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <u767di6jhx2ufl77d5zo2eg7rjqq7cladstsggvncophzerhbi@kr2vjer2bfby>
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
 <Z9ZuMzPS8dmQWe8D@shikoro>
 <Z9Z5S7ES8d7mjTsJ@shikoro>
 <20250316094042.GB29719@pendragon.ideasonboard.com>
 <Z9asKLWKyrDXDwjh@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9asKLWKyrDXDwjh@shikoro>
X-Proofpoint-GUID: 4n67qKKTf7vdOWLMxdfRpqJa6HsIq1Ns
X-Proofpoint-ORIG-GUID: 4n67qKKTf7vdOWLMxdfRpqJa6HsIq1Ns
X-Authority-Analysis: v=2.4 cv=Jem8rVKV c=1 sm=1 tr=0 ts=67d6f193 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=bOCYWOrEvSxgmqsQ7gIA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=724 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503160114

On Sun, Mar 16, 2025 at 11:47:04AM +0100, Wolfram Sang wrote:
> 
> > > Just to make sure: there can only be one bridge, right? Because the
> > > suggested name is not unique.
> > 
> > Bridges can be chained. It's highly unlikely that a chain would contain
> > multiple bridges of the same model, as that would be quite pointless,
> > but in theory it could happen.
> 
> Thanks for the input, Laurent. I suggest to keep the unique name then.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

