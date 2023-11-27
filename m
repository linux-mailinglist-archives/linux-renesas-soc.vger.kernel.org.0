Return-Path: <linux-renesas-soc+bounces-300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0108E7FAD84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 23:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 328DD1C20AE0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 22:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F3A4643C;
	Mon, 27 Nov 2023 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwxDQvYh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A8F136;
	Mon, 27 Nov 2023 14:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701124470; x=1732660470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ts77A1VNiEc2CT8sAwLfGF3duEMUZ+i3j/tFM1XLqJM=;
  b=AwxDQvYheNxk5PpJM9MeOtrqnj9g/dSOdAT7gTLTpWmgBhn+78TQzU8P
   TI7POBG2RBEGlOPDxcSfcOH1fxGn62RASKcydoefKVNEYvh9c+W7uNy8s
   oellzRYzPwKBaCRLWb2Vg3o4C9hdR9b3hlwPjgdwk0KtD/SV0Huo6Brhl
   N5jddgLxB0CiFpTbxT31jfez1rvyLIEYnmACdJRZXOMM5L86/ksT53DwF
   EEvevC119a6/1NqDpmGLPQkLzIQ1H9qw1Ujpaf/4eRcb6ihWws+qbEHpa
   HLEz3N4/zQMBtvpaCc9l4AUBSB2zgehg66UTyL+5yavkNpbhO5FmbP7xq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="392557646"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="392557646"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 14:34:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1099898612"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="1099898612"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2023 14:34:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7kBN-0006j2-0f;
	Mon, 27 Nov 2023 22:34:25 +0000
Date: Tue, 28 Nov 2023 06:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, s.shtylyov@omp.ru,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH net-next 8/9] net: rswitch: Add jumbo frames handling for
 TX
Message-ID: <202311280447.HzrM7Jdd-lkp@intel.com>
References: <20231127115334.3670790-9-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127115334.3670790-9-yoshihiro.shimoda.uh@renesas.com>

Hi Yoshihiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[cannot apply to net-next/main linus/master horms-ipvs/master v6.7-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Shimoda/net-rswitch-Drop-unused-argument-return-value/20231127-195705
base:   net/main
patch link:    https://lore.kernel.org/r/20231127115334.3670790-9-yoshihiro.shimoda.uh%40renesas.com
patch subject: [PATCH net-next 8/9] net: rswitch: Add jumbo frames handling for TX
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231128/202311280447.HzrM7Jdd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280447.HzrM7Jdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280447.HzrM7Jdd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/renesas/rswitch.c:1680:42: warning: variable 'dma_addr' is uninitialized when used here [-Wuninitialized]
    1680 |         if (dma_mapping_error(ndev->dev.parent, dma_addr))
         |                                                 ^~~~~~~~
   drivers/net/ethernet/renesas/rswitch.c:1663:21: note: initialize the variable 'dma_addr' to silence this warning
    1663 |         dma_addr_t dma_addr, dma_addr_orig;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/dma_addr +1680 drivers/net/ethernet/renesas/rswitch.c

9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1658  
8e0aa1ff44ca30b Nathan Chancellor 2022-11-03  1659  static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *ndev)
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1660  {
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1661  	struct rswitch_device *rdev = netdev_priv(ndev);
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1662  	struct rswitch_gwca_queue *gq = rdev->tx_queue;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1663  	dma_addr_t dma_addr, dma_addr_orig;
109b25d13e00543 Yoshihiro Shimoda 2023-11-22  1664  	netdev_tx_t ret = NETDEV_TX_OK;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1665  	struct rswitch_ext_desc *desc;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1666  	unsigned int i, nr_desc;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1667  	u8 die_dt;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1668  	u16 len;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1669  
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1670  	nr_desc = (skb->len - 1) / RSWITCH_DESC_BUF_SIZE + 1;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1671  	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - nr_desc) {
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1672  		netif_stop_subqueue(ndev, 0);
a60caf039e96d80 Yoshihiro Shimoda 2023-05-29  1673  		return NETDEV_TX_BUSY;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1674  	}
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1675  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1676  	if (skb_put_padto(skb, ETH_ZLEN))
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1677  		return ret;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1678  
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1679  	dma_addr_orig = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
782486af9b5b764 Yoshihiro Shimoda 2023-11-22 @1680  	if (dma_mapping_error(ndev->dev.parent, dma_addr))
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1681  		goto err_kfree;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1682  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1683  	gq->skbs[gq->cur] = skb;
e0e4f789171ba70 Yoshihiro Shimoda 2023-11-27  1684  	gq->unmap_addrs[gq->cur] = dma_addr;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1685  
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1686  	/* DT_FSTART should be set at last. So, this is reverse order. */
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1687  	for (i = nr_desc; i-- > 0; ) {
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1688  		desc = &gq->tx_ring[rswitch_next_queue_index(gq, true, i)];
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1689  		die_dt = rswitch_ext_desc_get_die_dt(nr_desc, i);
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1690  		dma_addr = dma_addr_orig + i * RSWITCH_DESC_BUF_SIZE;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1691  		len = rswitch_ext_desc_get_len(die_dt, skb->len);
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1692  		if (!rswitch_ext_desc_set(rdev, skb, desc, dma_addr, len, die_dt))
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1693  			goto err_unmap;
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1694  	}
33f5d733b589031 Yoshihiro Shimoda 2023-02-09  1695  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1696  	wmb();	/* gq->cur must be incremented after die_dt was set */
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1697  
9ce54e0ed5479a1 Yoshihiro Shimoda 2023-11-27  1698  	gq->cur = rswitch_next_queue_index(gq, true, nr_desc);
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1699  	rswitch_modify(rdev->addr, GWTRC(gq->index), 0, BIT(gq->index % 32));
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1700  
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1701  	return ret;
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1702  
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1703  err_unmap:
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1704  	dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1705  
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1706  err_kfree:
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1707  	dev_kfree_skb_any(skb);
782486af9b5b764 Yoshihiro Shimoda 2023-11-22  1708  
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1709  	return ret;
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1710  }
3590918b5d07aa5 Yoshihiro Shimoda 2022-10-31  1711  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

