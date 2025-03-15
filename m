Return-Path: <linux-renesas-soc+bounces-14425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D748A632BA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 23:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BEB37A5BFB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 22:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E40DD26D;
	Sat, 15 Mar 2025 22:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4t26SKj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F7B1C6FE4
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078638; cv=none; b=OLiU4s5ITN42Jb2/jsjXIqptZOj98KiizzcmF4vF/dWXP5ubVduY0N609g/EG5HuRJwAdIfOn7n6SKmxGorDeE1CakzK0v5ew6nFla2Mp6H7vBnDoRBq/vmcAHfvJ/xM2BZSfRDZxsO7EKccVokH9XMes/GzgL1ZIue3AocYpBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078638; c=relaxed/simple;
	bh=Klhp6tSZ4NGrz+4AoK2g7Ro7IV/ptG7umePW3f+Xr8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1f7WOYXwTkayDFR+aGVEG2XKoKLh6m6cW6KJusd/eYRi6qXfRHvOTGKGXda8Ho1Hs12zZcgP7SRe4pVbvfvRR1NVVSTkv95vKWQZ1pgrUmimSVQuidsKq1SiBZMNJAfkjuN2KLIJ84UZROevGyNDpmD6x8+a8dnjjpyE2MOSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4t26SKj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FLgjS6008265
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 22:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Sgyz07YUw5IhHZAiYm3pn7c
	6RPv9zndIT5Q8z9bYZc=; b=W4t26SKj6Xd2ad8Atax36DYu+oiuCSuZOxSPptcw
	hqkk47bzIWcAb8hm7JnZK6iquycRWVLobdEG0XRi3wt30BVxbUPPs/3y4wsmW74k
	9/9BZi8ps24aBtz+RdjyrQtOepFPtWW+bMx9O0gktX8elA+Dj9vadLylbU/dWCJj
	mCPgcfmVHln4l/7F7hf7SeAURqc5+b36zsUXOA/veX6oeUESEa/f8n8FGz4knn6A
	9m2RKfI+vNv6KqmRUfIYinQswO3EztBQsSSfHbWeGm4CKTtRb9hSfm9qzhO1RwCO
	lxu/ovSJjC7zPBInXzs1K9rhAJ3eZPI0Sng0Ku/jveqJ9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2ah99qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 22:43:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c5e92d41so592679385a.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 15:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078634; x=1742683434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Sgyz07YUw5IhHZAiYm3pn7c6RPv9zndIT5Q8z9bYZc=;
        b=VvVyfyCAaMZu1ZUKstP5dRZ6rkndVSOUi7fIoA03KI/zbEdwm8kmNG5h0g0JvPAyyV
         QIyOHkoMo4VUXIp5Imh/C+mLUN8QiZPXCBfIEkb9wuZ3i1+GA7/ZeO/iNJU3bq7s9oK/
         ItpdiW5W+bkjTMC6FOaEsDL9iNjcVgEEDHvcjLXHKKofb7u+StsOLYuc+IG6Rf9T4C5b
         nzUSW/pnzo1KB+hCCDTftO3aEdM7oeBg1NVmas45cXFh7xXSiD3LIsyJkaLkt6WVvjnf
         pRnAGthxaPG0Vl2EJIdX0g8V8OxBFYMZUOc/XNzUUK5dJN+YxnwixWGFnESwO35X8lW/
         Zo3Q==
X-Gm-Message-State: AOJu0YwSZFd11wxwgWPwNsIwwGLn0rK8TdG39qbDLhRna7USs8tGqmoO
	WWbXzakJ8NsrE/syZUMMC5DKsUKHxp4P8dPlyFfq/91mxXUWMZu4Uqjel3iU2CYkdlaNIOyEq/A
	sAFAY3MhMbX7hqm3DU25FX/MP2sRhxdru/GGr41h0e2PmpsBa4rJfinhJktriEXEaEGfzdg==
X-Gm-Gg: ASbGnctOCvdWnOdyhVBmkX9f+tml/4UM3WUJ1DzuC4pw2lXU9unMfbEOZK5JFmntAzo
	sQDZuuQhIKEivmBnjc04FKNK8iWhH/PNbKFiuJ4AqFH81nDxMrZ7qM1hBN6msamziKGSwZrEj8N
	j3MRyeckf6MwJwB0YiknU/38G51MFZUxyDDBEBHLEGwqTLJmUtjovp6IstiVitWHTqazkPHbEP8
	x3+Uc0QM4JEs2FXRXWmbVkvksgUU0E6y6U/1d4MrK2j4jgzaaJDvXLHDlxfmbdSq9yGLIZ5SQ5b
	e/5UTOg05nbL6iLADLTzFSoO5tWzeDHGtE0iWJRHCBwtQ3Ib0qA7xvMs0KP2oK9lYMF1SDe2KgJ
	THlQ=
X-Received: by 2002:a05:620a:4004:b0:7c5:4750:92ff with SMTP id af79cd13be357-7c57c79b8fdmr1035977985a.7.1742078634239;
        Sat, 15 Mar 2025 15:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo3K7nMi5i8BuubjPzchuT4O6D5B6pZcY0s3dDHcojhqSo8OGwIpIFifMUSVhVfdlxr8gFlQ==
X-Received: by 2002:a05:620a:4004:b0:7c5:4750:92ff with SMTP id af79cd13be357-7c57c79b8fdmr1035976685a.7.1742078633940;
        Sat, 15 Mar 2025 15:43:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864e9csm924638e87.121.2025.03.15.15.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:43:51 -0700 (PDT)
Date: Sun, 16 Mar 2025 00:43:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
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
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
X-Proofpoint-ORIG-GUID: Hxg1Ygf8myqrBP-zSnSx8cPPnQYG_xu0
X-Proofpoint-GUID: Hxg1Ygf8myqrBP-zSnSx8cPPnQYG_xu0
X-Authority-Analysis: v=2.4 cv=R7kDGcRX c=1 sm=1 tr=0 ts=67d602ab cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=LDBv8-xUAAAA:8 a=O1LN-3MKiCKZpL0Be2MA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=657 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150167

On Sat, Mar 15, 2025 at 09:15:11PM +0100, Wolfram Sang wrote:
> Do not create a custom directory in debugfs-root, but use the
> debugfs_init callback to create a custom directory at the given place
> for the bridge. The new directory layout looks like this on a Renesas
> GrayHawk-Single with a R-Car V4M SoC:
> 
> 	/sys/kernel/debug/dri/feb00000.display/DP-1/1-002c

Would you rather create a subdir using the bridge name (ti_sn65dsi86)
rather than dev_name? I don't know if we have an established practice.

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Changes since v1:
> * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> * remove RFT because tested on hardware
> 
-- 
With best wishes
Dmitry

