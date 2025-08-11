Return-Path: <linux-renesas-soc+bounces-20236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFB8B20A2D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 15:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8959F2A1F66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 13:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D242E11DD;
	Mon, 11 Aug 2025 13:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8f6b7Kw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01D2DEA72
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918785; cv=none; b=Qs77R/yvDRvohIj2eduvtS8X9ZUf7oHN2HcMyOt9bnMcjbbnWJ4lusXps6Lj8NDeVqfH7VIbV/GpYBDevDH/46MRI9WVBpfSWPfPiqIGaTWvQ5wjx1jQzBP0FP9w85v0OQPGFwf32LCSpTPXQ+Dte+CfO+uY0Cz8LVVyhyA/GC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918785; c=relaxed/simple;
	bh=OTq73ODXf6BmvMGuOO/3rCMmGqcdD7/49PfTkqLOHOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKjhESAJJy+1Kc6f1RZfgGbimbDPFN15w73AV1sS/2u8gAztyy0MWP3X9Dz7zLud1y+Rjdnyv8IkhU6I5ReCUIQ9t9O0/u12K4tjPXybB4AB3zD06DYzS+f+oSDkfTW8HZ9ucaBc1nnJ4vsw9KIQKlj7ClZm+bQSpriZVInqLds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8f6b7Kw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9LN028799
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 13:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vRikIynOffv5hukm3CKQ6SgT
	vsP8Ryyr+lMrwvSQIzY=; b=p8f6b7KwJiYJ1X2hf94LyRPBUQyawbhk9VSvJzGE
	DcS0zOtYY2HjC5TEq5XRYFGd5ZmWt2OniURI87DtmkMygR94tLhXxzwXev1O7sGM
	wsnL8Uct1JMYVLGowrnGkSpgkpzztPyGRQ/l6RrB4EQ/ZU87Pfn4saIFdqqWNQvw
	0jmZ9nrljs7UUKQDs3hC5RJ71aqmfRcMwozM5IlDwOWBowpH9tKj/JmmgZrhQyqg
	CutdLldAKoUXN5szorjHp7uTnYgn3AFufDl9qK7gZs3Cu+KcQp7ZWP+bD+kY3qHg
	Xom/m64tqGBryAwEH7hMeuLe2b9WBcvSctNuyWxldJyHdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9smp2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 13:26:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-478f78ff9beso162807641cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 06:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754918781; x=1755523581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRikIynOffv5hukm3CKQ6SgTvsP8Ryyr+lMrwvSQIzY=;
        b=mQ+MucYBdpJBYo0j0P2ZSRt3iSyao/sdPpW9veE+Tv46cqcIskndPjaMHNu4b7tv00
         4dY6pODSTBACAvJ8Ov3/ALf2g99pbRv0P3NNC2CXw5tyLBY5WGobhdJZ3VwpcwWmPRaP
         p5flA0JjcmzEy5Y7uKzuUGKAPf0/CcsCDaWDRyjmQmGJBjEpnobs9rUlcWIYvPd9fr2s
         oSaiE6XmBSD0dlWr5eJzUTj0us0dCz8QAHE6Ix6xY1FEMpODfbNGyvw9sGBg8E/Y7kz7
         JBH3mBEVJ/FQa93b+lfR9SW+PViqF9RA021OcCf5ADbkdM4/pjuHhn0LevLpwA9DiOlC
         nkZg==
X-Forwarded-Encrypted: i=1; AJvYcCVXXEEdSOUE3rV2goKlpraFi0upaOe1OXU9Wak6nrr0OyNLzQOkAlmlvd2kNpHdWN1msZnqz5tyFyY1dRVLTbP64Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTV0RlaU7e6fqrXl7rOlY2DtxlNt0bcX4oBgFBLA5SRccHw/zz
	DQwFQPtVyuLuXjqpUo2bKPFDEnIZuyYDDK2p63GO+FaSK/0bVJni73oM0b3fjJGDJ+Mv7pYmPFm
	VIoAuJuGifPge4o0vWCp8akxK4udGvzu7T8WmsmNzNFTg6Vh4PN4Op2Wte8Qfiow0a+jZ06wmlw
	==
X-Gm-Gg: ASbGncs17raqsiOPaK8ofB9BAUb0tvyRNyXn59JlQi0CmQR0ZymRjEjCFaGvbSixFu3
	0wmYigEaE2+3tkfNA9FDlEkJG8HSaLAmAzPKapxXX1UaKbJOGVzOHSCI4TVt7SgZHeu3qBF3BNB
	6kDtv4ZBVV7jcUb+WqO/4h7erCbEEFggucBOEklmYLF1MHaKQWWXz+trDSOC/tHDVmg6SIJrjLT
	qP3EDUXKWk9OWldFy72QvmQuUQKOGY5Dn9uIDUniC6xI+A7PKiZc7/chz3Q//yq4vY2fymKHaFw
	cq4qOEK50EthS8dNAoyHWvMGAPSZDGuHJ8qJtevI/hcwcA9cURRN2I+kmmm1mlVN46FKLXxfIa/
	e+xM5mDhmmbuWGm+PJoU1yJeNWKMq0G/t/Gk+PlkFM6Xsre/5UPf0
X-Received: by 2002:a05:622a:58c6:b0:4b0:75f1:4cd5 with SMTP id d75a77b69052e-4b0aed5ec14mr139029271cf.44.1754918780896;
        Mon, 11 Aug 2025 06:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0wKTLCLx4/yIBgQvD8Ue94ZiVJ7wpTEfZ89QbuRpyBiuJsOKla4drlyaZDIdLWLJCAt0VIQ==
X-Received: by 2002:a05:622a:58c6:b0:4b0:75f1:4cd5 with SMTP id d75a77b69052e-4b0aed5ec14mr139028901cf.44.1754918780301;
        Mon, 11 Aug 2025 06:26:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc7c67a5asm1192051e87.77.2025.08.11.06.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:26:19 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:26:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, kernel-list@raspberrypi.com,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
        uma.shankar@intel.com, jani.nikula@intel.com, harry.wentland@amd.com,
        siqueira@igalia.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
        liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, robin.clark@oss.qualcomm.com,
        abhinav.kumar@linux.dev, tzimmermann@suse.de,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, mcanal@igalia.com,
        dave.stevenson@raspberrypi.com,
        tomi.valkeinen+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811111546.GA30760@pendragon.ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6899ef7e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=4yu1Or5Oec3-_3BIJ7kA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: gp3qAf5dh_ejjNPFjcGmhP01CYUVxzI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX5PZh6Yi0l4Wf
 xSLdHxEytcR4uugjZSVPVs/GjUWOBr+pl1klXoQ7ipMkjShpcVfqn/K/suOPBSZvCLR89Lew/dU
 5vmNCarStXQ8Cb08blTMGY1TR11eXL9fG8CAU9rVILk7vKjGXo4zIKCoHPdbavbyrt41TUro0HO
 isvPFj4lu6nyhee1zvB3672yjsH+kc6yXFRp0Fpwswg9ZL7kkQD7YkL0zw9QN1fk3CzoGesfpLD
 3IivIEKGteri9F8x/SO2bCz+c2UKD+HNtjGOlhVjqPJgT4TthNOYC7y/2YmQyNDqO9CxV1YSKzl
 +HfuGJTYn95ypEi3TU5skv0dkFN8rZ+zjFYZTD3sZAohnukBBIsuE6ZsXkCDMaToYCr4eo5k1LT
 BF5VVEsW
X-Proofpoint-GUID: gp3qAf5dh_ejjNPFjcGmhP01CYUVxzI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Mon, Aug 11, 2025 at 02:15:46PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 11, 2025 at 01:22:30PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Aug 11, 2025 at 12:44:29PM +0300, Laurent Pinchart wrote:
> > > On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> > > > Some drivers cannot work with the current design where the connector
> > > > is embedded within the drm_writeback_connector such as intel and
> > > > some drivers that can get it working end up adding a lot of checks
> > > > all around the code to check if it's a writeback conenctor or not.
> > > > To solve this we move the drm_writeback_connector within the
> > > > drm_connector and remove the drm_connector base which was in
> > > > drm_writeback_connector. We do all other required
> > > > modifications that come with these changes along with addition
> > > > of new function which returns the drm_connector when
> > > > drm_writeback_connector is present.
> > > > All drivers will be expected to allocate the drm_connector.
> > > > 
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
> > > >  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
> > > >  include/drm/drm_writeback.h     | 68 ++++-----------------------------
> > > >  3 files changed, 89 insertions(+), 72 deletions(-)
> > > > 
> > > > @@ -2305,6 +2360,11 @@ struct drm_connector {
> > > >  	 * @cec: CEC-related data.
> > > >  	 */
> > > >  	struct drm_connector_cec cec;
> > > > +
> > > > +	/**
> > > > +	 * @writeback: Writeback related valriables.
> > > > +	 */
> > > > +	struct drm_writeback_connector writeback;
> > > 
> > > No, sorry, that's a bad idea. Most connectors have nothing to do with
> > > writeback, you shouldn't introduce writeback-specific fields here.
> > > drm_writeback_connector happens to be a drm_connector because of
> > > historical reasons (it was decided to reuse the connector API exposed to
> > > userspace instead of exposing a completely separate API in order to
> > > simplify the implementation), but that does not mean that every
> > > connector is related to writeback.
> > > 
> > > I don't know what issues the Intel driver(s) have with
> > > drm_writeback_connector, but you shouldn't make things worse for
> > > everybody due to a driver problem.
> > 
> > Suraj is trying to solve a problem that in Intel code every drm_connector
> > must be an intel_connector too. His previous attempt resulted in a loose
> > abstraction where drm_writeback_connector.base wasn't initialized in
> > some cases (which is a bad idea IMO).
> > 
> > I know the historical reasons for drm_writeback_connector, but I think
> > we can do better now.
> > 
> > So, I think, a proper approach would be:
> > 
> > struct drm_connector {
> >     // other fields
> > 
> >     union {
> >         struct drm_connector_hdmi hdmi; // we already have it
> >         struct drm_connector_wb wb;  // this is new
> >     };
> > 
> >     // rest of the fields.
> > };
> 
> I still don't like that. This really doesn't belong here. If anything,
> the drm_connector for writeback belongs to drm_crtc.

Why? We already have generic HDMI field inside drm_connector. I am
really hoping to be able to land DP parts next to it. In theory we can
have a DVI-specific entry there (e.g. with the subconnector type).
The idea is not to limit how the drivers subclass those structures.

I don't see a good case why WB should deviate from that design.

> If the issue is that some drivers need a custom drm_connector subclass,
> then I'd rather turn the connector field of drm_writeback_connector into
> a pointer.

Having a pointer requires additional ops in order to get drm_connector
from WB code and vice versa. Having drm_connector_wb inside
drm_connector saves us from those ops (which don't manifest for any
other kind of structure). Nor will it take any more space since union
will reuse space already taken up by HDMI part.

> 
> > I plan to add drm_connector_dp in a similar way, covering DP needs
> > (currently WIP).

-- 
With best wishes
Dmitry

