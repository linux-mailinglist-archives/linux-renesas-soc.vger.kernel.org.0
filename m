Return-Path: <linux-renesas-soc+bounces-17957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EAAAD1667
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 02:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5921C16A462
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 00:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46416D27E;
	Mon,  9 Jun 2025 00:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MkORAGaF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774321E489
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jun 2025 00:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749430286; cv=none; b=TqeauZ0gg4YePPC3MBxszvvXVbOZj7VJzFHD6K3xfaWcY7SaHscpt3LromBRqFSGouVIRWo6qR8nVtheTMjgsQs65TB0obs7lJDnXOUzvU+NJ7Hj2mkA6pq+CMazK45+GacyW4pw8avyCjioX8av3oS8z6sD/0GK74dkNRlbpmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749430286; c=relaxed/simple;
	bh=8S6HYzYYfdFc2GH1aog83DGprnavF4jGjecrMy7dxN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpXOlTmWqVZ+cGQ0fwlSQ9eKnSQ9CzwA6/xpeRUkZEwqjM9bRNImIgvCQeULLBxF6FGRL8ekZwGTvgi47RZkoT9OHbHMAcET4xdXJ5AyChAoywfZE3APL4pudSlUcwegfhvcB4s4SOHtsD7RsGjCphVOFSq0Y7TBbTLWll4VzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MkORAGaF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749430284; x=1780966284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8S6HYzYYfdFc2GH1aog83DGprnavF4jGjecrMy7dxN0=;
  b=MkORAGaFpdUSR/t2ltshL+G5FFAuYTPNS4d5NgL2WZrVnu0yWoA+BzEz
   ZU+MHlr5xyOLrq6nu40+EB3WCyij0yBmR9oTJofdiiJfsLcFUVmT22aZ7
   yEHjKyHyEA9lO2s+nvbY7QDZ1RHQDUtxruc+4lIedeaamS17o/iqPmLh5
   sKxsWJygiYjNVgE12Ov2dK+ZgKMLXiNvNXBa/Av4R/BUtOULocBN38h/g
   AkJu94x/9mxXEd+rTdnihNoqLy2tXzsV4o4+c5XgjYaKReqwAa3UvO6qv
   zW+U1D0WzFpTCEOUkTWw+we1JBuImFP6iyBOEj33udrBfVLajiFlWe7bh
   A==;
X-CSE-ConnectionGUID: i59V31TtRrq3YL7ygxgO/A==
X-CSE-MsgGUID: ughvX9irQVeYN179oHmDfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51497134"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="51497134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 17:51:23 -0700
X-CSE-ConnectionGUID: totC/warQ+CwtLHNkTLCeQ==
X-CSE-MsgGUID: ZiNGWszkTN26BRDe8LU63A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="151605279"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jun 2025 17:51:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOQjN-0006fF-0l;
	Mon, 09 Jun 2025 00:51:17 +0000
Date: Mon, 9 Jun 2025 08:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
Message-ID: <202506090832.Vo4IJeD2-lkp@intel.com>
References: <20250608142636.54033-5-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608142636.54033-5-marek.vasut+renesas@mailbox.org>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/drm-rcar-du-dsi-Convert-register-bits-to-BIT-macro/20250609-054641
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250608142636.54033-5-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
config: i386-buildonly-randconfig-005-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090832.Vo4IJeD2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090832.Vo4IJeD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506090832.Vo4IJeD2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:1064:11: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1063 |                                          "Long Packet Response longer than RX buffer (%d), limited to %ld Bytes\n",
         |                                                                                                       ~~~
         |                                                                                                       %zu
    1064 |                                          wc, msg->rx_len);
         |                                              ^~~~~~~~~~~
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:1090:7: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1089 |                                          "Expected Short Packet Response too long (%ld), limited to 2 Bytes\n",
         |                                                                                    ~~~
         |                                                                                    %zu
    1090 |                                          msg->rx_len);
         |                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +1064 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c

  1020	
  1021	static ssize_t rcar_mipi_dsi_host_rx_transfer(struct mipi_dsi_host *host,
  1022						      const struct mipi_dsi_msg *msg)
  1023	{
  1024		struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
  1025		u8 *rx_buf = (u8 *)(msg->rx_buf);
  1026		u32 reg, data, status, wc;
  1027		int i, ret;
  1028	
  1029		/* RX transfer received data validation and parsing starts here. */
  1030		reg = rcar_mipi_dsi_read(dsi, TOSR);
  1031		if (reg & TOSR_TATO) {	/* Turn-Around TimeOut. */
  1032			/* Clear TATO Turn-Around TimeOut bit. */
  1033			rcar_mipi_dsi_write(dsi, TOSR, TOSR_TATO);
  1034			return -ETIMEDOUT;
  1035		}
  1036	
  1037		reg = rcar_mipi_dsi_read(dsi, RXPSR);
  1038	
  1039		if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
  1040			/* Transfer with zero-length RX */
  1041			if (!(reg & RXPSR_RCVACK)) {
  1042				/* No ACK on RX response received */
  1043				return -EINVAL;
  1044			}
  1045		} else {
  1046			/* Transfer with non-zero-length RX */
  1047			if (!(reg & RXPSR_RCVRESP)) {
  1048				/* No packet header of RX response received */
  1049				return -EINVAL;
  1050			}
  1051	
  1052			if (reg & (RXPSR_CRCERR | RXPSR_WCERR | RXPSR_AXIERR | RXPSR_OVRERR)) {
  1053				/* Incorrect response payload */
  1054				return -ENODATA;
  1055			}
  1056	
  1057			data = rcar_mipi_dsi_read(dsi, RXPHDR);
  1058			if (data & RXPHDR_FMT) {	/* Long Packet Response */
  1059				/* Read Long Packet Response length from packet header. */
  1060				wc = data & 0xffff;
  1061				if (wc > msg->rx_len) {
  1062					dev_warn(dsi->dev,
  1063						 "Long Packet Response longer than RX buffer (%d), limited to %ld Bytes\n",
> 1064						 wc, msg->rx_len);
  1065					wc = msg->rx_len;
  1066				}
  1067	
  1068				if (wc > 16) {
  1069					dev_warn(dsi->dev,
  1070						 "Long Packet Response too long (%d), limited to 16 Bytes\n",
  1071						 wc);
  1072					wc = 16;
  1073				}
  1074	
  1075				for (i = 0; i < msg->rx_len; i++) {
  1076					if (!(i % 4))
  1077						data = rcar_mipi_dsi_read(dsi, RXPPD0R + i);
  1078	
  1079					rx_buf[i] = data & 0xff;
  1080					data >>= 8;
  1081				}
  1082			} else {	/* Short Packet Response */
  1083				if (msg->rx_len >= 1)
  1084					rx_buf[0] = data & 0xff;
  1085				if (msg->rx_len >= 2)
  1086					rx_buf[1] = (data >> 8) & 0xff;
  1087				if (msg->rx_len >= 3) {
  1088					dev_warn(dsi->dev,
  1089						 "Expected Short Packet Response too long (%ld), limited to 2 Bytes\n",
  1090						 msg->rx_len);
  1091				}
  1092			}
  1093		}
  1094	
  1095		if (reg & RXPSR_RCVAKE) {
  1096			/* Acknowledge and Error report received */
  1097			return -EFAULT;
  1098		}
  1099	
  1100		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
  1101					!(status & PPIDL0SR_DIR),
  1102					2000, 10000, false, dsi, PPIDL0SR);
  1103		if (ret < 0) {
  1104			dev_err(dsi->dev, "Command RX DIR timeout (0x%08x)\n", status);
  1105			return ret;
  1106		}
  1107	
  1108		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
  1109					status & PPIDL0SR_STPST,
  1110					2000, 10000, false, dsi, PPIDL0SR);
  1111		if (ret < 0) {
  1112			dev_err(dsi->dev, "Command RX STPST timeout (0x%08x)\n", status);
  1113			return ret;
  1114		}
  1115	
  1116		return 0;
  1117	}
  1118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

