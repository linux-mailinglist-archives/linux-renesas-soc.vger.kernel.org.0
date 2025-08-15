Return-Path: <linux-renesas-soc+bounces-20570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E5B28846
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 00:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783BFAC62D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Aug 2025 22:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E1723D7FD;
	Fri, 15 Aug 2025 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaywDozi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9223A9A0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755296461; cv=none; b=Z3VWxiyzeMvL4bfpX47RSEb8+Fba/xMci0hfpmLJx0mlv7PuEFrVD/NzxGabVz0EKRQax18s8hZeJPsseTW9+8iMp+CGACz10i3sa1wWgAidEyP22fIrIYXbDLhDQBJ3QBwFH2Wy3sEirFPg6HT31mpcW1uUxCWEIADu0KcMIWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755296461; c=relaxed/simple;
	bh=Lun1KbMNTdj7tMcKPIuWNukEyJvSZNaUcOyaPS3/xdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIqZt3v3IKxFRZTO0vEm26GAdEP4AiiPYd9GdlyXXsprWydTkhnHA1KDGqHXTB1j/rDnLTHSJI/XHQMSmQGweyR25hGz+B/S79u86PczaCcMcByK04u2X5Q9K0RdWcxSWhdXi/UA5aj2JQ1X1dgfdSKh82UmGogHJsw7aiKGRmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaywDozi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FJKm0i014962
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 22:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xfIBhnpUDRVNIWjXRgxsYT8X
	VCA1w9Y6OWwHkBmVkwQ=; b=KaywDoziy0fxrA3uFl6uoMxKbTDM2EUGBAX26H/6
	XrWOSY4LPTflZg2g/TnAlXFBHwO6kx68lg6JJNk7KCiR1CaGE9cmaVkklrUmm11a
	13DahpnZ+g2MPucq6ZyzW6iKpoME46KHivAIAQbCAWkq2hz9KHh7aBr3LBUEGG8a
	bEFwlFCKguKFzmoOJ7xMOhAh66SjDU0EDVgxCkLtTLDAX37TTFDEnrfSyvFykFnX
	4NYol075SgWSBzrykyzqVX0kPELrmb6ZulQOLe2hvLlXbRzZCXumBkhxVkd/Vitx
	brnB3CNu4iWlsHLnn8xIwR+RtdGNgM5PK9KWRamu/xXEkQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmm9h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 22:20:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a92827a70so51613526d6.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Aug 2025 15:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755296457; x=1755901257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfIBhnpUDRVNIWjXRgxsYT8XVCA1w9Y6OWwHkBmVkwQ=;
        b=Mw+qamQ7izssGm3htnVLSwuFQHYfxcumBRvBAq8GFmb9TPcd3vIac+ldXUT8Gjr9tn
         8tUnEx+J9nCFgp6IRCZiV7Pv5LgbqNSQRpfleaCBt1KV11yyy40jL9fXkDhAc82Dx0Uo
         kk3abNelGh3m0KJbP2tLob2ezws6kbnz4ImSkIKSqG4ghc0bueMxr1dxFyzi8DEzMf80
         Jd67w3dcG/80WRTlXZ9RZgSOX8dFycA3Xdt+cHTkU6M+UZPkkCJ0BFLLrgTQX83i7ZNI
         yDZxIvpaKg2BUcKTmCOvwRW+RSVZXgCPCVpFdUQd0KOrBAaHxYhq8dMOSKTI5kWR5er/
         B7Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWYTS3ToAcLkbfmFysk/gaicNBy+283G+PXCNzR4BUghY6RmxKLlYEtCPnRgN2GXaERL/dpIwr5JFChEuyW5kEwiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyma+wluaJOg+S1QcwQ6/ixToKPHRauUn3TEENZzUgvH+wyFoZr
	Pox3EXawBJe8HgyvWzBZrjOZgdNfMlo/IuhuBYdLcRgK/ZHtLMUs4DdlJBG1ApIr5bLMAFYpYHN
	E9XllTILg5nuFKD1umbfcRM7DQlval9P594873c0Zc0dRf9WTDqBOOjbjlZabaPoR2+zSTtN6oQ
	==
X-Gm-Gg: ASbGncsyT1uIa4gt3SlnwwaqxS/wvDIMTGU1ZtBeNgrJYIrVXMVa0YN9/0fSXw6GvCO
	uE+LDK8SBI4erjLZ1P1GcHAZ0wDgET5Cou9WmIGvJGW42DXVHE4ZaCL4+9W3240Yfou0zwlWpW/
	UHvEyXFXAB/IjyzT5fCrh8Ng1XRQfmEcvDWlNKP42JPcmcLa3P4Y/kh4tWacli6zSqBVjF7qIND
	l8NnDlu4A+s9WCdlg87iGcB2H4IRelDNPaWtVOnkhigr6C+qNQtkUmmH0sfD4aU6EFaYPPo3TT9
	iEYyDCGK0NJK5oLq9T11e+cZtGW2BkEIPmuxkDYOM66AMBXZkOkmPTrbDX1+1QAY09rcJAL1Df7
	BULawVdYYFf8RFexQas2o2/teuizwSkjxXHkLK6JPApD4IAWjbGMu
X-Received: by 2002:a05:6214:27c2:b0:709:82dc:b1b2 with SMTP id 6a1803df08f44-70bb064aab5mr7415106d6.48.1755296457505;
        Fri, 15 Aug 2025 15:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1+iZ0Ln0WZk9wKMEFeC3GuUiWeKAJqXs2A1a7u9zGnMDfpKmmxWgkIpmWbduQTZnYFsEO3A==
X-Received: by 2002:a05:6214:27c2:b0:709:82dc:b1b2 with SMTP id 6a1803df08f44-70bb064aab5mr7414886d6.48.1755296457044;
        Fri, 15 Aug 2025 15:20:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc9a6sm518362e87.78.2025.08.15.15.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 15:20:56 -0700 (PDT)
Date: Sat, 16 Aug 2025 01:20:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "liviu.dudau@arm.com" <liviu.dudau@arm.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
        "Murthy, Arun R" <arun.r.murthy@intel.com>,
        "Shankar, Uma" <uma.shankar@intel.com>,
        "Nikula, Jani" <jani.nikula@intel.com>,
        "harry.wentland@amd.com" <harry.wentland@amd.com>,
        "siqueira@igalia.com" <siqueira@igalia.com>,
        "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "airlied@gmail.com" <airlied@gmail.com>,
        "simona@ffwll.ch" <simona@ffwll.ch>,
        "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
        "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
        "mcanal@igalia.com" <mcanal@igalia.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "tomi.valkeinen+renesas@ideasonboard.com" <tomi.valkeinen+renesas@ideasonboard.com>,
        "kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>,
        "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <hc6f6wgsnauh72cowocpm55tikejhiha5z4mgufeq7v6gb2qml@kmgfd26bigos>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX9FXddnx0Z1ks
 pTPsMQ7QRb1O/GWN13gIKNJE+jBhoAtSfGnO74Jy/zi/mE6fekML3ZaU2fxHfrkbXcZMpQL0j/N
 rG0pKh68WBXE7lcq/9JFn0LF1iawHMoAjy/3Swh3/kNp5DqUmDp/JTRMW4ZE4WxzZWydQlUXzvp
 ozIAC3AATLrkzeYjKZlfA/wfacUXt/GaEknr/mjK7q4WDy1AI1i2mKWtbZxzP1+Nh2X0+qPTisu
 k+iXm0ZHnV9JZbr1BWQahtaGdSb1VTpBuieLwp9Mb+amtI1T7NHHXHeYbRkKr2kpYdMkjm5OymI
 53gbxLLWpF7TTcMY0ZczReslesW8eePw1iovfxquvXdA5ygroM3y4gJMVgR9OYD/PpT0eoyr53n
 mzQECEFy
X-Proofpoint-GUID: ehV1GzcQ9xwYgKv_oLv645hJvT_EndSl
X-Proofpoint-ORIG-GUID: ehV1GzcQ9xwYgKv_oLv645hJvT_EndSl
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689fb2ca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=7CQSdrXTAAAA:8 a=WdlRDaJtcICMsET58csA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On Thu, Aug 14, 2025 at 05:13:54PM +0100, liviu.dudau@arm.com wrote:
> Hi,
> 
> On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > > };
> > > >
> > > > I still don't like that. This really doesn't belong here. If anything,
> > > > the drm_connector for writeback belongs to drm_crtc.
> > > 
> > > Why? We already have generic HDMI field inside drm_connector. I am really
> > > hoping to be able to land DP parts next to it. In theory we can have a DVI-
> > > specific entry there (e.g. with the subconnector type).
> > > The idea is not to limit how the drivers subclass those structures.
> > > 
> > > I don't see a good case why WB should deviate from that design.
> > > 
> > > > If the issue is that some drivers need a custom drm_connector
> > > > subclass, then I'd rather turn the connector field of
> > > > drm_writeback_connector into a pointer.
> > > 
> > > Having a pointer requires additional ops in order to get drm_connector from
> > > WB code and vice versa. Having drm_connector_wb inside drm_connector
> > > saves us from those ops (which don't manifest for any other kind of structure).
> > > Nor will it take any more space since union will reuse space already taken up by
> > > HDMI part.
> > > 
> > > >
> > 
> > Seems like this thread has died. We need to get a conclusion on the design.
> > Laurent do you have any issue with the design given Dmitry's explanation as to why this
> > Design is good for drm_writeback_connector.
> 
> I'm with Laurent here. The idea for drm_connector (and a lot of drm structures) are to
> be used as base "classes" for extended structures. I don't know why HDMI connector ended
> up inside drm_connector as not all connectors have HDMI functionality, but that's a cleanup
> for another day.

Maybe Maxime can better comment on it, but I think it was made exactly
for the purpose of not limiting the driver's design. For example, a lot
of drivers subclass drm_connector via drm_bridge_connector. If
struct drm_connector_hdmi was a wrapper around struct drm_connector,
then it would have been impossible to use HDMI helpers for bridge
drivers, while current design freely allows any driver to utilize
corresponding library code.

> 
> drm_writeback_connector uses the 'base' drm_connector only for a few things, mostly in
> __drm_writeback_connector_init() and prepare_job()/cleanup_job(). In _init() we just setup
> the properties and the encoder after we disable interlacing. prepare_job()/cleanup_job()
> is another workaround to be to some custom ops some drivers might want for signalling. So
> we should be able to convert the 'base' drm_connector to a pointer relatively easy. We shouldn't
> need to get to the drm_connector from a drm_writeback_connector() outside drm_writeback.c.
> 
> Then it looks like what we need is a __drm_writeback_connector_init_with_connector() where we
> can pass a base pointer and remember it. Maybe an extra parameter to existing init functions,
> or a new one that skips the encoder initialisation entirely.

I've refactored out drm_encoder, that's not a big problem. The bigger
problem is the embedded 'drm_connector base' field. It's really use to
overlook that it's not initialized / not used.


-- 
With best wishes
Dmitry

