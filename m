Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDA959ECF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 21:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbiHWT6f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 15:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbiHWT6U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 15:58:20 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F21786C2B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661281744; x=1692817744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xBFL36xzbBhw3pvkHFxAFjXmBsofEsVU8PPhz+4jLuM=;
  b=OvxUg1VvMAZk1BkrZGzpB9Dx3floD7Zfof4kWFi/cro0jyIN7+fY19g8
   TNOjxpR8EkTkY88LexX1KTeyUuNl77eUbBRD+jHZO8pg9y72MMMKW7/Cc
   keVC/Svi7BcC2aHfJ0fWCIWw68RnH/iWowV21ealRM4q892k15G5nDyy8
   jjqPNhu/Q69043n2+lplQnwNSuPqfRpis3l+fRU8SZuew/l0Mar4oDEBP
   An0jJiCeoY/VXHj5d2AW1cfqVypZv5HW+pPxFZKexv1VQCGFpye1nMtV6
   Ns5o0VvLX+q44KvtOb4/w0tsmWBzKCKOrvPmPSMTtPZdNeko+t6TWNg7t
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="380065286"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="380065286"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 12:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; 
   d="scan'208";a="751791017"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2022 12:09:02 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQZGm-0000Rt-0L;
        Tue, 23 Aug 2022 19:09:00 +0000
Date:   Wed, 24 Aug 2022 03:08:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/4] drm: rcar-du: fix DSI enable & disable sequence
Message-ID: <202208240201.ss8E6NY0-lkp@intel.com>
References: <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822130513.119029-4-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pinchartl-media/drm/du/next]
[also build test WARNING on linus/master v6.0-rc2 next-20220823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
base:   git://linuxtv.org/pinchartl/media.git drm/du/next
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220824/202208240201.ss8E6NY0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d037472981c443d699c022aa91c5335f686d82ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/drm-rcar-du-DSI-fixes/20220822-210756
        git checkout d037472981c443d699c022aa91c5335f686d82ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/rcar-du/rcar_du_crtc.c:34:
>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h:26:6: warning: no previous prototype for 'rcar_mipi_dsi_pclk_disable' [-Wmissing-prototypes]
      26 | void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rcar_mipi_dsi_pclk_disable +26 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

    25	
  > 26	void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
    27	{
    28	}
    29	#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
    30	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
