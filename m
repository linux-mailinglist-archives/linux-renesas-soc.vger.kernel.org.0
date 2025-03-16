Return-Path: <linux-renesas-soc+bounces-14440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A007A63660
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 17:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730113ACBEE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 16:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8A942A8B;
	Sun, 16 Mar 2025 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBn56hP7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E931C861B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742141773; cv=none; b=Wn79xCf9CXZtrR7RlPoeS6Zy5oeajH7/ayJ262Nr/RlE8G+eqPMtkMeVDftB0mFcaaqfAurHlKX9UXODyMjisRfiR3fjVqDPKyvSX5F7R9QU+CL9P2fqQaw3WlNC2UW0RWariRpKukt+32CAc7B1fqC8ufNPlqNe0sUoeTqgKfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742141773; c=relaxed/simple;
	bh=WZswD1RGjbxwIR151BAknHEMlkdsvJ8Z0Z3jEfhbg5Q=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwV1lyiill+cTsRhkPFG7u2i++vsnA7hDkQJIsmyJLomcCGCpFxuA7us5kUA54/6N5BFfSKHPWGSpWtpXOxRxV6+svJuj4B3Rs5WKJuxY0Xz+aLPZlbuDjP2UaRRMzn/w0aaSxucLfZHpttqUKefDKGXBOciM+ZWdJJaBSd5ag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBn56hP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GFDA5w021143
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 16:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gZ8Bn6DY+92bU3zQgD3fwtJO
	nB6LTLol4X+ChLCFZuU=; b=ZBn56hP7WG2aOF7Z/LEOBswMKcl2Ph/VUf3m7Zo7
	lXZOqFep/3GiUIqqwMEq/7gFKyimoKm5IqSb6vrZRwxkn/g6O4O1Ax7+5Zx8Lh7b
	jJE94u1eydOzyc0jlZh9tc3jRgKitBOwTZmt3B8mPY7tio970p2GPRTvTOcnajI9
	cEaHGnZXkIRSDouUWTtjqSjtau9REHrgIax08GV+BSc5d0TKRlHhBcgHHpXgzrF/
	8DAeyxk2NRGV0NMLstD/nkfBftCTwnCaA8JD7waPad1xAa5rwTxQ24K6EYR35kYc
	2a/Fvko04SAjJJ11Sc2J0GFB/UF1W27w01T1ChA2wAjzqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1u8ae1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 16:16:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so83756516d6.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 09:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141763; x=1742746563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ8Bn6DY+92bU3zQgD3fwtJOnB6LTLol4X+ChLCFZuU=;
        b=itT46a/uS7vbDpFP8zpIuRliwIBzTD29eC8fvAWqjCmRJttlZaPn+3RMPq7cgIXfvx
         29TcDLoGmp9Cf1ifKXZU1tDbJ11KZmK33UW+9I7eCh1iBqUe+kZUCAhbiSRjoei89/Hm
         2427ye28EbwcJmro/pPdKKUZrUnmDmX3dwsWlEXzr9qWQsk9miy5tXpdbm7eReQmJX9w
         S5Waa1u3I63KY73MK135T18ylh+ogY+VTvyPFFww70GjUG3397wxJUZMUa+WFENOPj35
         q1VLHMRk6DZhamO2udyFF2S6ZNtiY8fHj9MyVzhboMbsFaZPsKq/5E2p5ogGAKi+Fre0
         N4iA==
X-Forwarded-Encrypted: i=1; AJvYcCVwTw3VB23aPhGolPMmEZkjnrEQ6WGq3pg11/p6PHG82L5IYRWNXwvvlRKLHPHRsavUGX/e/TTXt4A2wIg6vggXag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrNG4nCi+VFcgfeMzzv+NPQpfqD9c1gt+3h/3BTiShRAg81BO
	vQAbCgOaxaq1GIfrQMx+9QBVT6dlvXzaU2byKSWHGdEyfElDhEnDdaeMtiFCxBnhrtbeuMLRytl
	ArczwKClVyQkHwP5tXkyeSPAUAgDCtZvOvdRt+OFbj/JxKsNClgWS5R8ni1IeIwNW+y1iqQ==
X-Gm-Gg: ASbGnctAxOWQwpy4yPCInfKwKYDfs5u0bHf76URL+3AM7uij6DXy0c+Spphl8GSPbGL
	V1qtUUkhu7E6bJbUsXO+V0LoHicYn3bh93IeQQtGNakic3Gk2TQpJZRp1MBfJAJdmeXPqPFHz/D
	HkJvMcGjIiO+SxMz/0UCJhugs9dWigCmt0zJfIGjbpY0r3kmxER5NAYDPRXYqCOKHDPhtVhz1/V
	1IJ1HQAjqe4GMuL4J23aL473CefucWJOEaNSG2u3XWK2QRrvrZhF4Nk26MdaEAFH9mMatmPcUre
	v+SHRbScRJ5LEm253FDSOMCESSS2lHFIoR8Y9gNd7KPpiBmqObu/G+CEDgtor421x4qDA9BmhVZ
	8H0k=
X-Received: by 2002:ad4:5ce3:0:b0:6e8:f3c3:9806 with SMTP id 6a1803df08f44-6eaea9961d9mr180504916d6.4.1742141762736;
        Sun, 16 Mar 2025 09:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdg8p4T5KZ4SfaCZdgydBqNUwuvyqjOZH8PVm8pCxczjyUKDH2qmzaDr+bex4uQZJ6V+84Ow==
X-Received: by 2002:ad4:5ce3:0:b0:6e8:f3c3:9806 with SMTP id 6a1803df08f44-6eaea9961d9mr180504566d6.4.1742141762461;
        Sun, 16 Mar 2025 09:16:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da6desm13199351fa.94.2025.03.16.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:16:00 -0700 (PDT)
Date: Sun, 16 Mar 2025 18:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
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
Subject: Re: [PATCH RFT v2] drm/bridge: ite-it6505: make use of debugfs_init
 callback
Message-ID: <aijszs4vqtfo6sdd3cg5arjj2q4fcklnbwk5ma5txo35xwz2kf@hx63juithpjj>
References: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
 <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>
 <Z9Zu_5K0DK_egHl4@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9Zu_5K0DK_egHl4@shikoro>
X-Proofpoint-GUID: esDc0oSM_p6BuBsRJ9eK7offR2_6-jms
X-Authority-Analysis: v=2.4 cv=c42rQQ9l c=1 sm=1 tr=0 ts=67d6f944 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=zy1tgE8bQ-mCDbwybkkA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: esDc0oSM_p6BuBsRJ9eK7offR2_6-jms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=825 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503160118

On Sun, Mar 16, 2025 at 07:26:07AM +0100, Wolfram Sang wrote:
> 
> > > +	struct dentry *debugfs = debugfs_create_dir(dev_name(it6505->dev), root);
> 
> I will switch away from dev_name() here, too, of course.
> 
> > >  	int i = 0;
> > >  
> > >  	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
> > >  		debugfs_create_file(debugfs_entry[i].name, 0644,
> > > -				    it6505->debugfs, it6505,
> > > -				    debugfs_entry[i].fops);
> > > +				    debugfs, it6505, debugfs_entry[i].fops);
> > >  		i++;
> > >  	}
> > >  }
> > 
> > Ni: I'd say, it's better to move this function rather than moving
> > it6505_bridge_funcs. LGTM otherwise.
> 
> I started like this but it meant to move all the sysfs file ops code as
> well. That was quite a chunk. You still prefer to do it?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

