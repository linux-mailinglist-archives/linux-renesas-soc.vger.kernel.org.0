Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2727DDE85
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Nov 2023 10:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjKAJgN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Nov 2023 05:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjKAJgM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2023 05:36:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA57101
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Nov 2023 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698831365; x=1730367365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQcVMl+Eke9MVg7KikDo0grhQc3HYH5rTxmxJ39pVpI=;
  b=hSE7FAIOIwHWKWhbbZJaSRY4ADgpJQU7xr/au4VZH1saaFTNn8rBwexh
   EmvO2bqj70CTU1L3F8fVr+oNN4WbcTBlUiuLpgeIwxD28Jxzzy0Ei28um
   CjOZRlInYcbniJvjUG9Yv5cNQmBQ5huSJhvRjQyfkamEiyem3LNh6bFAW
   11g1jBWxkao1e7YnuIWADrkokHqk7uuZfmOOt0oCebI5YhoIz+tAObKF+
   O7yM/nzr/Y/9NoXtKa8xMsfAoSn5ruavBEjpWJUokjS03drCFpf7cQfxE
   nmMgdWysaqDKgG/lpqQagAbjiX0jDeYp+X3wf++6b+PpXGpX8Szflh4PM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454941604"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="454941604"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831310259"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="831310259"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2023 02:36:03 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qy7dp-0000iK-1S;
        Wed, 01 Nov 2023 09:36:01 +0000
Date:   Wed, 1 Nov 2023 17:35:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 40/53] net/ipv4/tcp_ao.c:1536:13:
 error: implicit declaration of function 'crypto_ahash_alignmask'; did you
 mean 'crypto_ahash_alg_name'?
Message-ID: <202311011709.KSZRMITa-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   d2db27106b911291048ef82bee72ed5a489a83e0
commit: f1b3be20bcbbf97ba484e1ed11fa6b86e0df99ee [40/53] Merge remote-tracking branch 'crypto/master' into renesas-drivers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231101/202311011709.KSZRMITa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011709.KSZRMITa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011709.KSZRMITa-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp_ao.c: In function 'tcp_ao_key_alloc':
>> net/ipv4/tcp_ao.c:1536:13: error: implicit declaration of function 'crypto_ahash_alignmask'; did you mean 'crypto_ahash_alg_name'? [-Werror=implicit-function-declaration]
    1536 |         if (crypto_ahash_alignmask(tfm) > TCP_AO_KEY_ALIGN) {
         |             ^~~~~~~~~~~~~~~~~~~~~~
         |             crypto_ahash_alg_name
   cc1: some warnings being treated as errors


vim +1536 net/ipv4/tcp_ao.c

4954f17ddefc51 Dmitry Safonov 2023-10-23  1505  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1506  static struct tcp_ao_key *tcp_ao_key_alloc(struct sock *sk,
4954f17ddefc51 Dmitry Safonov 2023-10-23  1507  					   struct tcp_ao_add *cmd)
4954f17ddefc51 Dmitry Safonov 2023-10-23  1508  {
4954f17ddefc51 Dmitry Safonov 2023-10-23  1509  	const char *algo = cmd->alg_name;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1510  	unsigned int digest_size;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1511  	struct crypto_ahash *tfm;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1512  	struct tcp_ao_key *key;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1513  	struct tcp_sigpool hp;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1514  	int err, pool_id;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1515  	size_t size;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1516  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1517  	/* Force null-termination of alg_name */
4954f17ddefc51 Dmitry Safonov 2023-10-23  1518  	cmd->alg_name[ARRAY_SIZE(cmd->alg_name) - 1] = '\0';
4954f17ddefc51 Dmitry Safonov 2023-10-23  1519  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1520  	/* RFC5926, 3.1.1.2. KDF_AES_128_CMAC */
4954f17ddefc51 Dmitry Safonov 2023-10-23  1521  	if (!strcmp("cmac(aes128)", algo))
4954f17ddefc51 Dmitry Safonov 2023-10-23  1522  		algo = "cmac(aes)";
4954f17ddefc51 Dmitry Safonov 2023-10-23  1523  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1524  	/* Full TCP header (th->doff << 2) should fit into scratch area,
4954f17ddefc51 Dmitry Safonov 2023-10-23  1525  	 * see tcp_ao_hash_header().
4954f17ddefc51 Dmitry Safonov 2023-10-23  1526  	 */
4954f17ddefc51 Dmitry Safonov 2023-10-23  1527  	pool_id = tcp_sigpool_alloc_ahash(algo, 60);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1528  	if (pool_id < 0)
4954f17ddefc51 Dmitry Safonov 2023-10-23  1529  		return ERR_PTR(pool_id);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1530  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1531  	err = tcp_sigpool_start(pool_id, &hp);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1532  	if (err)
4954f17ddefc51 Dmitry Safonov 2023-10-23  1533  		goto err_free_pool;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1534  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1535  	tfm = crypto_ahash_reqtfm(hp.req);
4954f17ddefc51 Dmitry Safonov 2023-10-23 @1536  	if (crypto_ahash_alignmask(tfm) > TCP_AO_KEY_ALIGN) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  1537  		err = -EOPNOTSUPP;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1538  		goto err_pool_end;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1539  	}
4954f17ddefc51 Dmitry Safonov 2023-10-23  1540  	digest_size = crypto_ahash_digestsize(tfm);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1541  	tcp_sigpool_end(&hp);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1542  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1543  	size = sizeof(struct tcp_ao_key) + (digest_size << 1);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1544  	key = sock_kmalloc(sk, size, GFP_KERNEL);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1545  	if (!key) {
4954f17ddefc51 Dmitry Safonov 2023-10-23  1546  		err = -ENOMEM;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1547  		goto err_free_pool;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1548  	}
4954f17ddefc51 Dmitry Safonov 2023-10-23  1549  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1550  	key->tcp_sigpool_id = pool_id;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1551  	key->digest_size = digest_size;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1552  	return key;
4954f17ddefc51 Dmitry Safonov 2023-10-23  1553  
4954f17ddefc51 Dmitry Safonov 2023-10-23  1554  err_pool_end:
4954f17ddefc51 Dmitry Safonov 2023-10-23  1555  	tcp_sigpool_end(&hp);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1556  err_free_pool:
4954f17ddefc51 Dmitry Safonov 2023-10-23  1557  	tcp_sigpool_release(pool_id);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1558  	return ERR_PTR(err);
4954f17ddefc51 Dmitry Safonov 2023-10-23  1559  }
4954f17ddefc51 Dmitry Safonov 2023-10-23  1560  

:::::: The code at line 1536 was first introduced by commit
:::::: 4954f17ddefc51d218625dcdfaf422a253dad3fa net/tcp: Introduce TCP_AO setsockopt()s

:::::: TO: Dmitry Safonov <dima@arista.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
