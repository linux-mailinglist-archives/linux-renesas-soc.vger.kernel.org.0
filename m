Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC771CED04
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2020 08:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgELG3J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 May 2020 02:29:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:17012 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgELG3J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 May 2020 02:29:09 -0400
IronPort-SDR: Fx5LTXu93RNPTLwZaqRKglOYx70HqVNTXzAHSsGlSpCGAln726/PXVEkyt0Tg6GbDl2uMVAJsz
 I0sR89HouAWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 23:29:05 -0700
IronPort-SDR: /Y5kg64+S31ucd4p+4SmiR92N4ZG/BgCIhfNT4xaQeFfxwlNgLfZwi5/LlB/d7o47z4SuN7JJN
 W5kkDOGBmCXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,382,1583222400"; 
   d="scan'208";a="463653475"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020) ([10.239.159.140])
  by fmsmga006.fm.intel.com with ESMTP; 11 May 2020 23:29:02 -0700
Date:   Tue, 12 May 2020 14:39:03 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Yongbo Zhang <giraffesnn123@gmail.com>, broonie@kernel.org,
        lgirdwood@gmail.com, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chen Li <licheng0822@thundersoft.com>
Cc:     kbuild-all@lists.01.org, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yongbo Zhang <giraffesnn123@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-ID: <20200512063903.GB20612@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508074753.10362-1-giraffesnn123@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yongbo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[also build test WARNING on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Yongbo-Zhang/ASoC-rsnd-add-interrupt-support-for-SSI-BUSIF-buffer/20200509-035713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> sound/soc/sh/rcar/ssi.c:531:1: warning: Unmatched '{'. Configuration: ''. [syntaxError]
   {
   ^
>> sound/soc/sh/rcar/ssi.c:531:1: warning: Unmatched '{'. Configuration: 'DEBUG'. [syntaxError]
   {
   ^

# https://github.com/0day-ci/linux/commit/391d452251464b78f72ba3a1fd9b6091b3d4a942
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 391d452251464b78f72ba3a1fd9b6091b3d4a942
vim +531 sound/soc/sh/rcar/ssi.c

ae5c322303fff5 Kuninori Morimoto 2013-07-21  527  
ae5c322303fff5 Kuninori Morimoto 2013-07-21  528  static int rsnd_ssi_quit(struct rsnd_mod *mod,
2c0fac19de2cd7 Kuninori Morimoto 2015-06-15  529  			 struct rsnd_dai_stream *io,
690602fcd85385 Kuninori Morimoto 2015-01-15  530  			 struct rsnd_priv *priv)
ae5c322303fff5 Kuninori Morimoto 2013-07-21 @531  {
ae5c322303fff5 Kuninori Morimoto 2013-07-21  532  	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
ae5c322303fff5 Kuninori Morimoto 2013-07-21  533  	struct device *dev = rsnd_priv_to_dev(priv);
391d452251464b Yongbo Zhang      2020-05-08  534  	int is_tdm, is_tdm_split;
391d452251464b Yongbo Zhang      2020-05-08  535  	int id = rsnd_mod_id(mod);
391d452251464b Yongbo Zhang      2020-05-08  536  	int i;
391d452251464b Yongbo Zhang      2020-05-08  537  	u32 sys_int_enable = 0;
391d452251464b Yongbo Zhang      2020-05-08  538  
391d452251464b Yongbo Zhang      2020-05-08  539  	is_tdm		= rsnd_runtime_is_tdm(io);
391d452251464b Yongbo Zhang      2020-05-08  540  	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
ae5c322303fff5 Kuninori Morimoto 2013-07-21  541  
fd9adcfdc1434f Kuninori Morimoto 2016-02-18  542  	if (!rsnd_ssi_is_run_mods(mod, io))
fd9adcfdc1434f Kuninori Morimoto 2016-02-18  543  		return 0;
fd9adcfdc1434f Kuninori Morimoto 2016-02-18  544  
e5d9cfc6f5fe56 Andrzej Hajda     2015-12-24  545  	if (!ssi->usrcnt) {
c0ea089dbad47a Kuninori Morimoto 2018-10-30  546  		dev_err(dev, "%s usrcnt error\n", rsnd_mod_name(mod));
e5d9cfc6f5fe56 Andrzej Hajda     2015-12-24  547  		return -EIO;
e5d9cfc6f5fe56 Andrzej Hajda     2015-12-24  548  	}
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  549  
26d34b11af6a34 Kuninori Morimoto 2016-02-18  550  	rsnd_ssi_master_clk_stop(mod, io);
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  551  
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  552  	rsnd_mod_power_off(mod);
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  553  
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  554  	ssi->usrcnt--;
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  555  
203cdf51f28820 Kuninori Morimoto 2018-06-12  556  	if (!ssi->usrcnt) {
203cdf51f28820 Kuninori Morimoto 2018-06-12  557  		ssi->cr_own	= 0;
203cdf51f28820 Kuninori Morimoto 2018-06-12  558  		ssi->cr_mode	= 0;
203cdf51f28820 Kuninori Morimoto 2018-06-12  559  		ssi->wsr	= 0;
203cdf51f28820 Kuninori Morimoto 2018-06-12  560  	}
203cdf51f28820 Kuninori Morimoto 2018-06-12  561  
391d452251464b Yongbo Zhang      2020-05-08  562  	/* disable busif buffer over/under run interrupt. */
391d452251464b Yongbo Zhang      2020-05-08  563  	if (is_tdm || is_tdm_split) {
391d452251464b Yongbo Zhang      2020-05-08  564  		switch (id) {
391d452251464b Yongbo Zhang      2020-05-08  565  		case 0:
391d452251464b Yongbo Zhang      2020-05-08  566  		case 1:
391d452251464b Yongbo Zhang      2020-05-08  567  		case 2:
391d452251464b Yongbo Zhang      2020-05-08  568  		case 3:
391d452251464b Yongbo Zhang      2020-05-08  569  		case 4:
391d452251464b Yongbo Zhang      2020-05-08  570  			for (i = 0; i < 4; i++) {
391d452251464b Yongbo Zhang      2020-05-08  571  				sys_int_enable = rsnd_mod_read(mod,
391d452251464b Yongbo Zhang      2020-05-08  572  						SSI_SYS_INT_ENABLE(i * 2));
391d452251464b Yongbo Zhang      2020-05-08  573  				sys_int_enable &= ~(0xf << (id * 4));
391d452251464b Yongbo Zhang      2020-05-08  574  				rsnd_mod_write(mod,
391d452251464b Yongbo Zhang      2020-05-08  575  					       SSI_SYS_INT_ENABLE(i * 2),
391d452251464b Yongbo Zhang      2020-05-08  576  					       sys_int_enable);
391d452251464b Yongbo Zhang      2020-05-08  577  			}
391d452251464b Yongbo Zhang      2020-05-08  578  
391d452251464b Yongbo Zhang      2020-05-08  579  			break;
391d452251464b Yongbo Zhang      2020-05-08  580  		case 9:
391d452251464b Yongbo Zhang      2020-05-08  581  			for (i = 0; i < 4; i++) {
391d452251464b Yongbo Zhang      2020-05-08  582  				sys_int_enable = rsnd_mod_read(mod,
391d452251464b Yongbo Zhang      2020-05-08  583  					SSI_SYS_INT_ENABLE((i * 2) + 1));
391d452251464b Yongbo Zhang      2020-05-08  584  				sys_int_enable &= ~(0xf << 4);
391d452251464b Yongbo Zhang      2020-05-08  585  				rsnd_mod_write(mod,
391d452251464b Yongbo Zhang      2020-05-08  586  					       SSI_SYS_INT_ENABLE((i * 2) + 1),
391d452251464b Yongbo Zhang      2020-05-08  587  					       sys_int_enable);
391d452251464b Yongbo Zhang      2020-05-08  588  			}
391d452251464b Yongbo Zhang      2020-05-08  589  
391d452251464b Yongbo Zhang      2020-05-08  590  			break;
391d452251464b Yongbo Zhang      2020-05-08  591  		}
391d452251464b Yongbo Zhang      2020-05-08  592  
ae5c322303fff5 Kuninori Morimoto 2013-07-21  593  	return 0;
ae5c322303fff5 Kuninori Morimoto 2013-07-21  594  }
ae5c322303fff5 Kuninori Morimoto 2013-07-21  595  

:::::: The code at line 531 was first introduced by commit
:::::: ae5c322303fff50b93d60e34c6563f1264a5941b ASoC: add Renesas R-Car SSI feature

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

