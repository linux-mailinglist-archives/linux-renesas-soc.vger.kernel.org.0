Return-Path: <linux-renesas-soc+bounces-20220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0BDB2052C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 12:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F00D318A19F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 10:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B6F2253E9;
	Mon, 11 Aug 2025 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUMKBBWj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5241A3BD7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754907757; cv=none; b=MO3NVwUSGr8yQHYi3P/Ij/zOIkA8a5YFKUq7PQXtxcIaoxXQ4Uletr9zgO76Rl3G+hjdwq0vF8VoeSa/nZdiEMY4ZGstvWj1VJc6FquoNlMmrkP32RKmFMCiyb6QKCsj4YUxo0EKXAcgUm3D35YNERDXyLW+ARmuB/+7iotX8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754907757; c=relaxed/simple;
	bh=un9Iyg0ms5LHybq45L9Cp1rYThzSovHW6L+pntYST00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyF8aMQE0e3i2XJtNF9gehgJlN2nZs4eDhLIZZmxJSJVrdQyGMYFoJOiTHODZvm0o3AU+qG5ZHOHs3JKV/cTt6TkBmm2Rfvb6n3m5+V2MAqDTpThGB7aNYrubADJnTYpH2XN5ZeAgH/L9bHvj7xyFQJu+Bhqh5LA49lSWBUs//I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUMKBBWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dK3x029604
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PPcIqJTmGqbCZt8ehrODmErw
	r7fSzpLsxZ7IoVmL2lM=; b=cUMKBBWj3EH5NRlROXLfL/zm1GMoUGSautoC7RSi
	1wFAYWVWYFr/14MQamSCXshR1yf0ddt7QdUlouf92lq6IqdPgv4cA9Us92bgpe/Q
	XAMtRfmEcewLgnxHI4mSVG8+gPnGySDiAUJOynQbjNbH9DGSd1JshvuIPrzNPJE1
	Tt3E/xNpMRfKdEnS3PHRhdYJb0Q0S+/jL9an1IMQJkAHT+fzc4i6aAy3O5pL8+Je
	Ul0IgWc8WON1I+6X9Pj7aCra3mBe6gCHvMslmeVu44jmA3qyjLdIINq8Aaz7E2DO
	udYJwqmIwSKNKk4/64boVtbG1TXvi972gfJNlnd8FlvEnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sm3s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 10:22:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0a3557d05so87734241cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 03:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907754; x=1755512554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPcIqJTmGqbCZt8ehrODmErwr7fSzpLsxZ7IoVmL2lM=;
        b=AdkC8AFgE73cepEb6PLgaTq/uemiovuvv8ZBlcheDv1OTVxWT6aaqjz2j9O6QDG9uv
         lwzk9hUlmAOeP1B0anx1bylj6kupIqgBIVWI0HkgqhyhTVSehMKCIuPer32g7gEQbvpm
         SxBOeu+odgrdrzzNJC20VtVikMR6eSNxAYT5LE1E54MtbBV3U2hOtmG9yYQ8hzAEg5xh
         JKDZTTAtv08Y4LGGmY+mJY2TPpRu+DWq472vDO85GZu56v3X437TBFOc2zKarBhswKwM
         VFwZNIwh0s/TFMHJUdrOhrRpdZKESAXB7b+rdi+PaMEqiAHD1UwKri1SNN08Ma86RFFL
         lt+g==
X-Forwarded-Encrypted: i=1; AJvYcCXwjiS60XTZbImhRmI70lmLsgdB4wjagKH96zFayvhu2yWWegfRCG08GBBiP65Ur5gPR9VFwsYbxDnesDKsFjjHMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbtwAjpkxNWvacstyngF6IXSDa6oh1xOlBAaG14cL3HdR0FI+a
	CEs7ONVigzgk4G7LMANI9fmtJiH8GiHEpAoIcavUvJ0kHgfViECKs5yjBvPWTsXPD5B8hllCgsF
	aiqmWPX9hBLdL0Ko5aRixKGoo8VJDv082sf6FTfegjji9DiVz1EWDN53CHJ5OptUhEwdOx9lisy
	4+QsmU3Q==
X-Gm-Gg: ASbGncsIPcjIhLM9nGtM7eb/9zBNc5+SZ7ftuDr4uABKI214KmvP+F3OdBpoyCeLQze
	S0hFoBgYpMhSJJjV5CXPUJlCbAS02LqMrrFV3lUPJ3sfLdmWyAXZexYcKe9AqtqVTcxKrFEm1A3
	QENw/wVrx26FXPoj007Q01UKU6jM8N5NMlZrVNBlTyX01NzStDvh/rt+9iUey9JWY7/PWKgMekl
	s9fqWzmE4cJiK32DAG1Q7L9RVM1pDiC+e64WzH5d2iFhvnjdQpc+iI+V3i8Q8zF82YNL16YM4mU
	5QUWDUA0YbyTG1N3oKbJY0XhWwZCj3XUi3f/XF2HfhqXWtdlzj5umo/bA02puYhyR4W0MVXWU2N
	zGBT7m96h7DIc+aUE6GU4oOUWw54uT5QWx7C/P5MiDQ3KRnnkHGJD
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id d75a77b69052e-4b0aec9df29mr168325861cf.25.1754907753773;
        Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/1O6odL8qEXPebSXBi5VVqvakd8Iz/cxzY+rK1t+2/oJ2Ljc14sGyM/aY/rldP9dMAv6Tpw==
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id d75a77b69052e-4b0aec9df29mr168325461cf.25.1754907753078;
        Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332389409f8sm43713731fa.76.2025.08.11.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:22:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:22:30 +0300
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
Message-ID: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811094429.GE21313@pendragon.ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6899c46b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=-rapNmeMCNZ-4dkNsN8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uBa4qyDQq4hkIXSQMcl9lgFMPbmJ3wvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX9Jr7BTEC9zG4
 fmABFyMlpoqSY6gw4Zctcj3IpCQB3ojEqwGWZCPXsYXkpYFTKUP2GBLP1HOQ4/ClO2MRaHASBmL
 zINkuU+PnmZQWYoFY7MvqIQI9wSD9v7zyltIWteu9wBNNWkEBl74gJ8wSA/0Si0EVahCGxqK4iz
 Xc6mOxUNSStq2bjXGG2wPLoaCzzJRAassvyC3f4R21A6IpylYlQjD2qDORhko4OZSkBzamwHa0s
 riMv/dZSjWlkTszS1MIX2mvKUPhqCO/Tkdo0Qo5IKoWg3oCBIH43qMsVzh39AkjWWwcYzjuIH7x
 /Owj3qOqTNp8+hkWookh3TmSigxXe1KO9viDXdJTu1EcMNOEEFZbrBs2PcvWUUNysp7EJkYLHEW
 gFJYWfRM
X-Proofpoint-GUID: uBa4qyDQq4hkIXSQMcl9lgFMPbmJ3wvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Mon, Aug 11, 2025 at 12:44:29PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> > Some drivers cannot work with the current design where the connector
> > is embedded within the drm_writeback_connector such as intel and
> > some drivers that can get it working end up adding a lot of checks
> > all around the code to check if it's a writeback conenctor or not.
> > To solve this we move the drm_writeback_connector within the
> > drm_connector and remove the drm_connector base which was in
> > drm_writeback_connector. We do all other required
> > modifications that come with these changes along with addition
> > of new function which returns the drm_connector when
> > drm_writeback_connector is present.
> > All drivers will be expected to allocate the drm_connector.
> > 
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
> >  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
> >  include/drm/drm_writeback.h     | 68 ++++-----------------------------
> >  3 files changed, 89 insertions(+), 72 deletions(-)
> > 
> > @@ -2305,6 +2360,11 @@ struct drm_connector {
> >  	 * @cec: CEC-related data.
> >  	 */
> >  	struct drm_connector_cec cec;
> > +
> > +	/**
> > +	 * @writeback: Writeback related valriables.
> > +	 */
> > +	struct drm_writeback_connector writeback;
> 
> No, sorry, that's a bad idea. Most connectors have nothing to do with
> writeback, you shouldn't introduce writeback-specific fields here.
> drm_writeback_connector happens to be a drm_connector because of
> historical reasons (it was decided to reuse the connector API exposed to
> userspace instead of exposing a completely separate API in order to
> simplify the implementation), but that does not mean that every
> connector is related to writeback.
> 
> I don't know what issues the Intel driver(s) have with
> drm_writeback_connector, but you shouldn't make things worse for
> everybody due to a driver problem.

Suraj is trying to solve a problem that in Intel code every drm_connector
must be an intel_connector too. His previous attempt resulted in a loose
abstraction where drm_writeback_connector.base wasn't initialized in
some cases (which is a bad idea IMO).

I know the historical reasons for drm_writeback_connector, but I think
we can do better now.

So, I think, a proper approach would be:

struct drm_connector {
    // other fields

    union {
        struct drm_connector_hdmi hdmi; // we already have it
        struct drm_connector_wb wb;  // this is new
    };

    // rest of the fields.
};

I plan to add drm_connector_dp in a similar way, covering DP needs
(currently WIP).

-- 
With best wishes
Dmitry

