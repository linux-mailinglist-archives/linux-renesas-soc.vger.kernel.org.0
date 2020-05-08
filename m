Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3611CBBFA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 May 2020 02:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgEIAsi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 May 2020 20:48:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:22236 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727774AbgEIAsi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 May 2020 20:48:38 -0400
IronPort-SDR: H1Kxfzeg2sw/HJeCmD11MDNQOhToHteUb5He5qdgJsCjEGobtWkmkC+JYDtmMWBDQsQFngpkTD
 ya57SG5uN+uA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 16:57:33 -0700
IronPort-SDR: A+lEhZ6KBqepgQ81g/NpWO8oy9SRD5vey2afxVwKEI9GuvJkQo3tcY7tc69qjXKUgCRER7Yy5g
 qOmyV+yw5Xng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,369,1583222400"; 
   d="gz'50?scan'50,208,50";a="462751528"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 May 2020 16:57:30 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXCrx-0008eX-GZ; Sat, 09 May 2020 07:57:29 +0800
Date:   Sat, 9 May 2020 07:56:36 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Yongbo Zhang <giraffesnn123@gmail.com>, broonie@kernel.org,
        lgirdwood@gmail.com, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chen Li <licheng0822@thundersoft.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongbo Zhang <giraffesnn123@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-ID: <202005090732.6ezYxpsf%lkp@intel.com>
References: <20200508074753.10362-1-giraffesnn123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <20200508074753.10362-1-giraffesnn123@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yongbo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on asoc/for-next]
[also build test ERROR on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Yongbo-Zhang/ASoC-rsnd-add-interrupt-support-for-SSI-BUSIF-buffer/20200509-035713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: arm-defconfig (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 6d2a66b10d458e34c852be46028092d2b46edc14)
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/sh/rcar/ssi.c:600:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:618:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:651:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:696:1: error: function definition is not allowed here
   {
   ^
>> sound/soc/sh/rcar/ssi.c:734:1: error: function declared in block scope cannot have 'static' storage class
   static bool rsnd_ssi_pio_interrupt(struct rsnd_mod *mod,
   ^
   sound/soc/sh/rcar/ssi.c:738:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:830:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:841:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:878:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:909:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:923:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:966:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:989:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:1033:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:1051:1: error: function definition is not allowed here
   {
   ^
   sound/soc/sh/rcar/ssi.c:1063:1: error: function definition is not allowed here
   {
   ^
>> sound/soc/sh/rcar/ssi.c:1069:12: error: use of undeclared identifier 'rsnd_ssi_common_probe'
           .probe          = rsnd_ssi_common_probe,
                             ^
>> sound/soc/sh/rcar/ssi.c:1070:13: error: use of undeclared identifier 'rsnd_ssi_common_remove'
           .remove         = rsnd_ssi_common_remove,
                             ^
>> sound/soc/sh/rcar/ssi.c:1071:11: error: use of undeclared identifier 'rsnd_ssi_pio_init'
           .init           = rsnd_ssi_pio_init,
                             ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

vim +600 sound/soc/sh/rcar/ssi.c

ae5c322303fff5 Kuninori Morimoto  2013-07-21  595  
919567d914b3c1 Kuninori Morimoto  2015-04-10  596  static int rsnd_ssi_hw_params(struct rsnd_mod *mod,
2c0fac19de2cd7 Kuninori Morimoto  2015-06-15  597  			      struct rsnd_dai_stream *io,
919567d914b3c1 Kuninori Morimoto  2015-04-10  598  			      struct snd_pcm_substream *substream,
919567d914b3c1 Kuninori Morimoto  2015-04-10  599  			      struct snd_pcm_hw_params *params)
919567d914b3c1 Kuninori Morimoto  2015-04-10 @600  {
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  601  	struct rsnd_dai *rdai = rsnd_io_to_rdai(io);
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  602  	unsigned int fmt_width = snd_pcm_format_width(params_format(params));
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  603  
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  604  	if (fmt_width > rdai->chan_width) {
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  605  		struct rsnd_priv *priv = rsnd_io_to_priv(io);
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  606  		struct device *dev = rsnd_priv_to_dev(priv);
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  607  
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  608  		dev_err(dev, "invalid combination of slot-width and format-data-width\n");
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  609  		return -EINVAL;
fb2815f44a9eb3 Dragos Tarcatu     2018-09-03  610  	}
919567d914b3c1 Kuninori Morimoto  2015-04-10  611  
919567d914b3c1 Kuninori Morimoto  2015-04-10  612  	return 0;
919567d914b3c1 Kuninori Morimoto  2015-04-10  613  }
919567d914b3c1 Kuninori Morimoto  2015-04-10  614  
6a25c8da00284f Kuninori Morimoto  2016-01-26  615  static int rsnd_ssi_start(struct rsnd_mod *mod,
2c0fac19de2cd7 Kuninori Morimoto  2015-06-15  616  			  struct rsnd_dai_stream *io,
690602fcd85385 Kuninori Morimoto  2015-01-15  617  			  struct rsnd_priv *priv)
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27 @618  {
597b046f0d99b0 Kuninori Morimoto  2017-08-08  619  	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
597b046f0d99b0 Kuninori Morimoto  2017-08-08  620  
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  621  	if (!rsnd_ssi_is_run_mods(mod, io))
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  622  		return 0;
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  623  
b4c83b17155781 Kuninori Morimoto  2015-12-17  624  	/*
b4c83b17155781 Kuninori Morimoto  2015-12-17  625  	 * EN will be set via SSIU :: SSI_CONTROL
b4c83b17155781 Kuninori Morimoto  2015-12-17  626  	 * if Multi channel mode
b4c83b17155781 Kuninori Morimoto  2015-12-17  627  	 */
4f5c634d58e719 Kuninori Morimoto  2016-02-18  628  	if (rsnd_ssi_multi_slaves_runtime(io))
0dc6bf75023a42 Kuninori Morimoto  2016-02-18  629  		return 0;
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  630  
597b046f0d99b0 Kuninori Morimoto  2017-08-08  631  	/*
597b046f0d99b0 Kuninori Morimoto  2017-08-08  632  	 * EN is for data output.
597b046f0d99b0 Kuninori Morimoto  2017-08-08  633  	 * SSI parent EN is not needed.
597b046f0d99b0 Kuninori Morimoto  2017-08-08  634  	 */
0c258657ddfe81 Matthias Blankertz 2020-04-17  635  	if (rsnd_ssi_is_parent(mod, io))
597b046f0d99b0 Kuninori Morimoto  2017-08-08  636  		return 0;
597b046f0d99b0 Kuninori Morimoto  2017-08-08  637  
597b046f0d99b0 Kuninori Morimoto  2017-08-08  638  	ssi->cr_en = EN;
597b046f0d99b0 Kuninori Morimoto  2017-08-08  639  
597b046f0d99b0 Kuninori Morimoto  2017-08-08  640  	rsnd_mod_write(mod, SSICR,	ssi->cr_own	|
597b046f0d99b0 Kuninori Morimoto  2017-08-08  641  					ssi->cr_clk	|
597b046f0d99b0 Kuninori Morimoto  2017-08-08  642  					ssi->cr_mode	|
597b046f0d99b0 Kuninori Morimoto  2017-08-08  643  					ssi->cr_en);
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  644  
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  645  	return 0;
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  646  }
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  647  
6a25c8da00284f Kuninori Morimoto  2016-01-26  648  static int rsnd_ssi_stop(struct rsnd_mod *mod,
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  649  			 struct rsnd_dai_stream *io,
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  650  			 struct rsnd_priv *priv)
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  651  {
6a25c8da00284f Kuninori Morimoto  2016-01-26  652  	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
6a25c8da00284f Kuninori Morimoto  2016-01-26  653  	u32 cr;
6a25c8da00284f Kuninori Morimoto  2016-01-26  654  
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  655  	if (!rsnd_ssi_is_run_mods(mod, io))
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  656  		return 0;
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  657  
0c258657ddfe81 Matthias Blankertz 2020-04-17  658  	if (rsnd_ssi_is_parent(mod, io))
6a25c8da00284f Kuninori Morimoto  2016-01-26  659  		return 0;
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  660  
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  661  	cr  =	ssi->cr_own	|
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  662  		ssi->cr_clk;
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  663  
ce548931207c0d Kuninori Morimoto  2017-10-31  664  	/*
ce548931207c0d Kuninori Morimoto  2017-10-31  665  	 * disable all IRQ,
ce548931207c0d Kuninori Morimoto  2017-10-31  666  	 * Playback: Wait all data was sent
ce548931207c0d Kuninori Morimoto  2017-10-31  667  	 * Capture:  It might not receave data. Do nothing
ce548931207c0d Kuninori Morimoto  2017-10-31  668  	 */
ce548931207c0d Kuninori Morimoto  2017-10-31  669  	if (rsnd_io_is_play(io)) {
54cb6221688660 Matthias Blankertz 2020-04-17  670  		rsnd_mod_write(mod, SSICR, cr | ssi->cr_en);
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  671  		rsnd_ssi_status_check(mod, DIRQ);
ce548931207c0d Kuninori Morimoto  2017-10-31  672  	}
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  673  
54cb6221688660 Matthias Blankertz 2020-04-17  674  	/* In multi-SSI mode, stop is performed by setting ssi0129 in
54cb6221688660 Matthias Blankertz 2020-04-17  675  	 * SSI_CONTROL to 0 (in rsnd_ssio_stop_gen2). Do nothing here.
54cb6221688660 Matthias Blankertz 2020-04-17  676  	 */
54cb6221688660 Matthias Blankertz 2020-04-17  677  	if (rsnd_ssi_multi_slaves_runtime(io))
54cb6221688660 Matthias Blankertz 2020-04-17  678  		return 0;
54cb6221688660 Matthias Blankertz 2020-04-17  679  
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  680  	/*
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  681  	 * disable SSI,
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  682  	 * and, wait idle state
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  683  	 */
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  684  	rsnd_mod_write(mod, SSICR, cr);	/* disabled all */
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  685  	rsnd_ssi_status_check(mod, IIRQ);
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  686  
597b046f0d99b0 Kuninori Morimoto  2017-08-08  687  	ssi->cr_en = 0;
597b046f0d99b0 Kuninori Morimoto  2017-08-08  688  
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  689  	return 0;
e7d850dd10f4e6 Kuninori Morimoto  2015-10-26  690  }
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  691  
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  692  static int rsnd_ssi_irq(struct rsnd_mod *mod,
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  693  			struct rsnd_dai_stream *io,
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  694  			struct rsnd_priv *priv,
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  695  			int enable)
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  696  {
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  697  	u32 val = 0;
391d452251464b Yongbo Zhang       2020-05-08  698  	int is_tdm, is_tdm_split;
391d452251464b Yongbo Zhang       2020-05-08  699  	int id = rsnd_mod_id(mod);
391d452251464b Yongbo Zhang       2020-05-08  700  
391d452251464b Yongbo Zhang       2020-05-08  701  	is_tdm		= rsnd_runtime_is_tdm(io);
391d452251464b Yongbo Zhang       2020-05-08  702  	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  703  
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  704  	if (rsnd_is_gen1(priv))
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  705  		return 0;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  706  
0c258657ddfe81 Matthias Blankertz 2020-04-17  707  	if (rsnd_ssi_is_parent(mod, io))
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  708  		return 0;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  709  
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  710  	if (!rsnd_ssi_is_run_mods(mod, io))
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  711  		return 0;
fd9adcfdc1434f Kuninori Morimoto  2016-02-18  712  
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  713  	if (enable)
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  714  		val = rsnd_ssi_is_dma_mode(mod) ? 0x0e000000 : 0x0f000000;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  715  
391d452251464b Yongbo Zhang       2020-05-08  716  	if (is_tdm || is_tdm_split) {
391d452251464b Yongbo Zhang       2020-05-08  717  		switch (id) {
391d452251464b Yongbo Zhang       2020-05-08  718  		case 0:
391d452251464b Yongbo Zhang       2020-05-08  719  		case 1:
391d452251464b Yongbo Zhang       2020-05-08  720  		case 2:
391d452251464b Yongbo Zhang       2020-05-08  721  		case 3:
391d452251464b Yongbo Zhang       2020-05-08  722  		case 4:
391d452251464b Yongbo Zhang       2020-05-08  723  		case 9:
391d452251464b Yongbo Zhang       2020-05-08  724  			val |= 0xff00;
391d452251464b Yongbo Zhang       2020-05-08  725  			break;
391d452251464b Yongbo Zhang       2020-05-08  726  		}
391d452251464b Yongbo Zhang       2020-05-08  727  	}
391d452251464b Yongbo Zhang       2020-05-08  728  
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  729  	rsnd_mod_write(mod, SSI_INT_ENABLE, val);
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  730  
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  731  	return 0;
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  732  }
615fb6c7b13b7f Kuninori Morimoto  2016-02-18  733  
d8d9b9730cd62c Kuninori Morimoto  2017-12-11 @734  static bool rsnd_ssi_pio_interrupt(struct rsnd_mod *mod,
d8d9b9730cd62c Kuninori Morimoto  2017-12-11  735  				   struct rsnd_dai_stream *io);
bfc0cfe6b7acb1 Kuninori Morimoto  2015-06-15  736  static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
bfc0cfe6b7acb1 Kuninori Morimoto  2015-06-15  737  				 struct rsnd_dai_stream *io)
ae5c322303fff5 Kuninori Morimoto  2013-07-21  738  {
690602fcd85385 Kuninori Morimoto  2015-01-15  739  	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
2b62786951ca38 Kuninori Morimoto  2018-02-13  740  	struct device *dev = rsnd_priv_to_dev(priv);
765ae7c8dda7d0 Kuninori Morimoto  2015-01-15  741  	int is_dma = rsnd_ssi_is_dma_mode(mod);
02299d9875bab5 Kuninori Morimoto  2015-05-21  742  	u32 status;
75defee0f1b3fc Kuninori Morimoto  2015-06-15  743  	bool elapsed = false;
6a25c8da00284f Kuninori Morimoto  2016-01-26  744  	bool stop = false;
391d452251464b Yongbo Zhang       2020-05-08  745  	int is_tdm, is_tdm_split;
391d452251464b Yongbo Zhang       2020-05-08  746  
391d452251464b Yongbo Zhang       2020-05-08  747  	is_tdm		= rsnd_runtime_is_tdm(io);
391d452251464b Yongbo Zhang       2020-05-08  748  	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
02299d9875bab5 Kuninori Morimoto  2015-05-21  749  
02299d9875bab5 Kuninori Morimoto  2015-05-21  750  	spin_lock(&priv->lock);
ae5c322303fff5 Kuninori Morimoto  2013-07-21  751  
02299d9875bab5 Kuninori Morimoto  2015-05-21  752  	/* ignore all cases if not working */
d5bbe7de563ccc Kuninori Morimoto  2015-06-15  753  	if (!rsnd_io_is_working(io))
02299d9875bab5 Kuninori Morimoto  2015-05-21  754  		goto rsnd_ssi_interrupt_out;
02299d9875bab5 Kuninori Morimoto  2015-05-21  755  
6a25c8da00284f Kuninori Morimoto  2016-01-26  756  	status = rsnd_ssi_status_get(mod);
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  757  
4e7d606cd52aa8 Kuninori Morimoto  2014-11-27  758  	/* PIO only */
d8d9b9730cd62c Kuninori Morimoto  2017-12-11  759  	if (!is_dma && (status & DIRQ))
d8d9b9730cd62c Kuninori Morimoto  2017-12-11  760  		elapsed = rsnd_ssi_pio_interrupt(mod, io);
ae5c322303fff5 Kuninori Morimoto  2013-07-21  761  
12927a8f802642 Kuninori Morimoto  2015-06-15  762  	/* DMA only */
2b62786951ca38 Kuninori Morimoto  2018-02-13  763  	if (is_dma && (status & (UIRQ | OIRQ))) {
c0ea089dbad47a Kuninori Morimoto  2018-10-30  764  		rsnd_dbg_irq_status(dev, "%s err status : 0x%08x\n",
c0ea089dbad47a Kuninori Morimoto  2018-10-30  765  			rsnd_mod_name(mod), status);
2b62786951ca38 Kuninori Morimoto  2018-02-13  766  
6a25c8da00284f Kuninori Morimoto  2016-01-26  767  		stop = true;
2b62786951ca38 Kuninori Morimoto  2018-02-13  768  	}
69e32a58bde674 Kuninori Morimoto  2015-10-26  769  
391d452251464b Yongbo Zhang       2020-05-08  770  	status = 0;
391d452251464b Yongbo Zhang       2020-05-08  771  
391d452251464b Yongbo Zhang       2020-05-08  772  	if (is_tdm || is_tdm_split) {
391d452251464b Yongbo Zhang       2020-05-08  773  		switch (id) {
391d452251464b Yongbo Zhang       2020-05-08  774  		case 0:
391d452251464b Yongbo Zhang       2020-05-08  775  		case 1:
391d452251464b Yongbo Zhang       2020-05-08  776  		case 2:
391d452251464b Yongbo Zhang       2020-05-08  777  		case 3:
391d452251464b Yongbo Zhang       2020-05-08  778  		case 4:
391d452251464b Yongbo Zhang       2020-05-08  779  			for (i = 0; i < 4; i++) {
391d452251464b Yongbo Zhang       2020-05-08  780  				status = rsnd_mod_read(mod,
391d452251464b Yongbo Zhang       2020-05-08  781  						       SSI_SYS_STATUS(i * 2));
391d452251464b Yongbo Zhang       2020-05-08  782  				status &= 0xf << (id * 4);
391d452251464b Yongbo Zhang       2020-05-08  783  
391d452251464b Yongbo Zhang       2020-05-08  784  				if (status) {
391d452251464b Yongbo Zhang       2020-05-08  785  					rsnd_dbg_irq_status(dev,
391d452251464b Yongbo Zhang       2020-05-08  786  						"%s err status : 0x%08x\n",
391d452251464b Yongbo Zhang       2020-05-08  787  						rsnd_mod_name(mod), status);
391d452251464b Yongbo Zhang       2020-05-08  788  					rsnd_mod_write(mod,
391d452251464b Yongbo Zhang       2020-05-08  789  						       SSI_SYS_STATUS(i * 2),
391d452251464b Yongbo Zhang       2020-05-08  790  						       0xf << (id * 4));
391d452251464b Yongbo Zhang       2020-05-08  791  					stop = true;
391d452251464b Yongbo Zhang       2020-05-08  792  					break;
391d452251464b Yongbo Zhang       2020-05-08  793  				}
391d452251464b Yongbo Zhang       2020-05-08  794  			}
391d452251464b Yongbo Zhang       2020-05-08  795  			break;
391d452251464b Yongbo Zhang       2020-05-08  796  		case 9:
391d452251464b Yongbo Zhang       2020-05-08  797  			for (i = 0; i < 4; i++) {
391d452251464b Yongbo Zhang       2020-05-08  798  				status = rsnd_mod_write(mod,
391d452251464b Yongbo Zhang       2020-05-08  799  						SSI_SYS_STATUS((i * 2) + 1));
391d452251464b Yongbo Zhang       2020-05-08  800  				status &= 0xf << 4;
391d452251464b Yongbo Zhang       2020-05-08  801  
391d452251464b Yongbo Zhang       2020-05-08  802  				if (status) {
391d452251464b Yongbo Zhang       2020-05-08  803  					rsnd_dbg_irq_status(dev,
391d452251464b Yongbo Zhang       2020-05-08  804  						"%s err status : 0x%08x\n",
391d452251464b Yongbo Zhang       2020-05-08  805  						rsnd_mod_name(mod), status);
391d452251464b Yongbo Zhang       2020-05-08  806  					rsnd_mod_write(mod,
391d452251464b Yongbo Zhang       2020-05-08  807  						SSI_SYS_STATUS((i * 2) + 1),
391d452251464b Yongbo Zhang       2020-05-08  808  						0xf << 4);
391d452251464b Yongbo Zhang       2020-05-08  809  					stop = true;
391d452251464b Yongbo Zhang       2020-05-08  810  					break;
391d452251464b Yongbo Zhang       2020-05-08  811  				}
391d452251464b Yongbo Zhang       2020-05-08  812  			}
391d452251464b Yongbo Zhang       2020-05-08  813  			break;
391d452251464b Yongbo Zhang       2020-05-08  814  		}
391d452251464b Yongbo Zhang       2020-05-08  815  	}
391d452251464b Yongbo Zhang       2020-05-08  816  
5342dff2326393 Kuninori Morimoto  2015-11-26  817  	rsnd_ssi_status_clear(mod);
02299d9875bab5 Kuninori Morimoto  2015-05-21  818  rsnd_ssi_interrupt_out:
02299d9875bab5 Kuninori Morimoto  2015-05-21  819  	spin_unlock(&priv->lock);
02299d9875bab5 Kuninori Morimoto  2015-05-21  820  
75defee0f1b3fc Kuninori Morimoto  2015-06-15  821  	if (elapsed)
75defee0f1b3fc Kuninori Morimoto  2015-06-15  822  		rsnd_dai_period_elapsed(io);
6a25c8da00284f Kuninori Morimoto  2016-01-26  823  
6a25c8da00284f Kuninori Morimoto  2016-01-26  824  	if (stop)
6a25c8da00284f Kuninori Morimoto  2016-01-26  825  		snd_pcm_stop_xrun(io->substream);
6a25c8da00284f Kuninori Morimoto  2016-01-26  826  

:::::: The code at line 600 was first introduced by commit
:::::: 919567d914b3c134e60c01db72a03a0adc5f41b9 ASoC: rsnd: make sure SSI parent/child uses same number of sound channel.

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--J2SCkAp4GZ/dPZZf
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
fYY4xT+VT2//fnn9F/iwf5HBb/5x9/bC0U93b38MKETsR/Gbl+IGGum43EHYoDE0dg18khK6
dDqbWIw+N1y0c53/7GrD1Wnv7Oz7n2+kPy4jzrL4aURklmlpCt5dRTRzZdeRtLrKc+ohRSKY
CKByMlzvapAibJvsdpKRFcbAKF8ev32enA5o/d9nq84sMSrXAB+qB+kdVktNLobL2CHZ4GCV
LqTCwsqcp+RhX/FNWdOd6tM4R41zTgqg9n3immWAdsiXTpD2tMebcM/vvajUQ0NsV+roKiTX
IbS0RoxQU+7irNkEOI81IvPTaY+pkYwAM8y3RhCzLcEtK0dgG4WbtYOrDamgYO0sdLqclgsf
VAQecWvQMN4Chm80W8/fLYAinLubAHXD92c7hpUX1tXXhifYgZRrgBFQJteW4GInTFWEcYYx
jtNYmJ5RRkpVJyUcYtg9dgTVt9Dd/oXO3brIwNERdnZP3dHrymD5WVtdw2uICW8VjAglGumX
8Il8Lk+Ej2KliIKIMKoWs866vFncTSDWA3Z5mEqC2CdoU9vC7drqHB0XZ0bLr1orQhg2gm7t
wlIHSX6XRGjPR2ENAnpb9r3qB0g5EJSnBvjZ1cxFkrowrxmWvn+IsWRQsuN/1zVGZA9lWIMI
3krsmB6cboL0TkQwEsT2OxmxQCdqAqa4iRb0Y0Ybq534rKltCdy+M+Jdd2qEmBUZGtloBKVV
BJccvDFEG1jSZITWiwSEdZ0nonoLiM8E33ATptGjh7AOlcd9kQjdo8dv1NNNP9sGVXyQpU0X
xvedEBddSgT95i67Zpw2lNWuiaNE2CMvxDiM0PYXkBbE0dgg92QYBhY1SaKIkJVE8HpUJ02b
6fqvKiKM2TYgXCLruG1AGHnPYBhTpIO0LUYjNQ6/b5gdjAGFB/Pi1pIlDYCu9d7R7jNnZbJb
lOEqGSp0f3adFeGDZ4Zzcf5BxcGDI0S9zqIy8AgGSMM/BFFbHBxC+qlD25bVtLnCHLt+HxiC
V/C5tYg7hkXNjpQrERWZJIS3Fg10CPMQZ4HmMNtWpqFvkUdZEaq49PwhaxkuxFBxh6qKCR5V
65osToig4CosyzM+jZaLEypOiyi2YQ/bDc6Oat9wLj++Y8xObeo6LiYV02DwHEKs0iRfnkTX
ENRKrqRjxzmW2p9VJGfvHSd4R5GcxfdxkzQNVTDHWVOfybeiNGRdkdW4PpaGpQ9XbcCL2+ac
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
98M2f5F3AwA=

--J2SCkAp4GZ/dPZZf--
