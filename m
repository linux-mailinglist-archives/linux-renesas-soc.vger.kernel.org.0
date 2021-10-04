Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A7442076B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 10:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhJDIlY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 04:41:24 -0400
Received: from mga12.intel.com ([192.55.52.136]:47483 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231566AbhJDIlX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 04:41:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="205473733"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; 
   d="scan'208";a="205473733"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2021 01:39:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; 
   d="scan'208";a="621779755"
Received: from pmittal1-mobl.gar.corp.intel.com (HELO localhost) ([10.251.223.27])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2021 01:39:30 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Fernando Ramos <greenfoo@u92.eu>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v2 00/17] drm: cleanup: Use DRM_MODESET_LOCK_ALL_* helpers where possible
In-Reply-To: <YVq49SWuC3T7i1a6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210924064324.229457-1-greenfoo@u92.eu> <20211001183655.GW2515@art_vandelay> <YVda4jNSGuQf50JV@intel.com> <20211001204815.GA2515@art_vandelay> <YVeGOyLzuhN7zzV7@intel.com> <YVfEWaLfYWdhezCa@intel.com> <YVgGklsHT5fkavDL@zacax395.localdomain> <YVjd7hLKtYG2bkY7@zacax395.localdomain> <YVq49SWuC3T7i1a6@intel.com>
Date:   Mon, 04 Oct 2021 11:39:27 +0300
Message-ID: <87ee912ngg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 04 Oct 2021, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> On Sun, Oct 03, 2021 at 12:32:14AM +0200, Fernando Ramos wrote:
>> On 21/10/02 09:13AM, Fernando Ramos wrote:
>> > 
>> > Sean, could you revert the whole patch series? I'll have a deeper look into the
>> > patch set and come up with a v3 where all these issues will be addressed.
>> > 
>> 
>> Hi Sean,
>> 
>> I now understand the nature of the issue that caused the problem with i915 and
>> have proceed to remove the global context structure (which revealed a similar
>> issue in the amdgpu driver).
>> 
>> I have prepared a V3 version of the patch set where these issues should
>> hopefully be fixed for both the i915 and amdgpu drivers.
>> 
>> In order to prevent causing more disruption, could you tell me what the proper
>> way to proceed would be? In particular:
>> 
>>   1. Is there any place where I can push my changes so that they are tested
>>      on a i915 machine? (Some type of automated pool)
>
> cc:intel-gfx, which it looks like you did, _but_ your patches did
> did not even apply against drm-tip so our CI rejected it. There was
> a reply to the patches from CI indicating that. And that is one
> reason I probably just ignored the whole thing. If it doesn't
> even apply/build it's not worth my time to read.
>
>> 
>>   2. I can test the amdgpu driver on my machine but, what about all the other
>>      architectures? What is the standard procedure? Should I simply publish V3
>>      and wait for feedback from the different vendors? (I would hate to cause a
>>      simular situation again)
>> 
>>   3. Should I post V3 on top of drm-next or drm-misc-next?
>
> The normal rule is: always work on drm-tip. That is what gets
> tested by our CI as well. Yes, it does mean a bit of extra hurdles
> during development since drm-tip is a rebasing tree, but there are
> tools like dim retip to help out here.
>
> As for where to merge them. I would generally recommed against merging
> i915 patches through drm-misc unless there is a very compelling reason
> to do so. i915 is a fast moving target and if there are significant
> changes coming in via drm-misc they usually will cause conflicts for
> people during drm-tip rebuild. Also I would expect to see an ack
> requested from i915 maintainers for merging anything significant via
> drm-misc, which I don't think happened in this case.

Indeed. All other things aside, it looks like it has enough conflict
potential to warrant merging via drm-intel anyway.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
