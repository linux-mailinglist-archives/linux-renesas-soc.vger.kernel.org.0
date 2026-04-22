Return-Path: <linux-renesas-soc+bounces-31495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B5rLX2m6GngOAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:44:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0415444E01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5B3D3012ABD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 10:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC283CD8A2;
	Wed, 22 Apr 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKigwTby"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE13CD8D6;
	Wed, 22 Apr 2026 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854623; cv=none; b=Wsc3FZhKIkTkjCpJb4Bbqs8CtOkJJ9SsgclBzNdq00PHEoyRiH/OmSRrwoq//Tr7OJFQmB3xlbVmkSpt06ROHz5qOFrSGLwiP1f44q6TV9o6ILV1uTqWHXM0dc+VUDkMs50d2fWoTrWVtJL1jkZaMryFHcAxRERsGd93ik2pZIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854623; c=relaxed/simple;
	bh=kjrMmCT8D/hLD+2OQdL12dB9asOMZqpCDxmMzIm0+Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G75g/2zB0GzW3kN8+tMowQmdQMDdtBJXiqrWX3NCr3RZu8YJ/rr9WiQ7X274w2Tif/aLj5IUiHx5r7iBfWbJVivO2plmgKeiZQrpO/6S9yqwT7v+RAzeu5ix34Vw7NRslLsujn1GhR4dzHvHFW1zYDjawlFXkIIHLrDuqj/H3cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKigwTby; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776854620; x=1808390620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kjrMmCT8D/hLD+2OQdL12dB9asOMZqpCDxmMzIm0+Mk=;
  b=TKigwTbyv+P6Nl2WHCx01SFIFj6ld8FJilxPHxFZRRpvmCpLJP7HP7oW
   X7ayy1FxUIiLDebO+RoM3w65uNgxFA1TZ59kCokXVh15EV5X36ZB+or/G
   qZTV2fovRDi0AM+fFoOiKtpOmP/S/9zM/6X4Houdjnvac0GXgpvFLs8Eo
   xrDwza+Rgbh1bzh0PxctvaQ4S9Y7c4kD9GOntg5/CLJA8S50fQ1oCN2a5
   Tvr4OgTaMGiVwjbub3BFDmhcDKUy8hqo3bsSESrqrFsnJ0WnC1RgNU4Q5
   BiMiFYuNgM1Kfa9VQQ9N03YpmTNZC/+wSpbkjSEW5aPAL532zDAqfaR62
   A==;
X-CSE-ConnectionGUID: 3wz1qw/+QX+WDpzz7wSwCg==
X-CSE-MsgGUID: LGHs6kNSTSa08ER+HJyuow==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77922777"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77922777"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 03:43:40 -0700
X-CSE-ConnectionGUID: uUE/1mwZQeu0JAkbNI2YgQ==
X-CSE-MsgGUID: VaREkrSkSk6ew6lXlcK6kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="262706360"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Apr 2026 03:43:37 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFV3O-000000000b7-2sM3;
	Wed, 22 Apr 2026 10:43:34 +0000
Date: Wed, 22 Apr 2026 18:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mark Brown <broonie@linaro.org>
Subject: Re: [PATCH v2] mailbox: don't free the channel if the startup
 callback failed
Message-ID: <202604221846.9nkpd0oi-lkp@intel.com>
References: <20260420114346.10586-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420114346.10586-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,sang-engineering.com,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31495-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,git-scm.com:url,spec.np:url]
X-Rspamd-Queue-Id: B0415444E01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on next-20260421]
[cannot apply to linus/master v7.0]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/mailbox-don-t-free-the-channel-if-the-startup-callback-failed/20260420-234226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20260420114346.10586-2-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH v2] mailbox: don't free the channel if the startup callback failed
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604221846.9nkpd0oi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604221846.9nkpd0oi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604221846.9nkpd0oi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mailbox.c:355:4: error: call to undeclared function 'mbox_clean_and_put_channel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     355 |                         mbox_clean_and_put_channel(chan);
         |                         ^
>> drivers/mailbox/mailbox.c:484:6: error: conflicting types for 'mbox_clean_and_put_channel'
     484 | void mbox_clean_and_put_channel(struct mbox_chan *chan)
         |      ^
   drivers/mailbox/mailbox.c:355:4: note: previous implicit declaration is here
     355 |                         mbox_clean_and_put_channel(chan);
         |                         ^
   2 errors generated.


vim +/mbox_clean_and_put_channel +355 drivers/mailbox/mailbox.c

   329	
   330	static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
   331	{
   332		struct device *dev = cl->dev;
   333		int ret;
   334	
   335		if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
   336			dev_err(dev, "%s: mailbox not free\n", __func__);
   337			return -EBUSY;
   338		}
   339	
   340		scoped_guard(spinlock_irqsave, &chan->lock) {
   341			chan->msg_free = 0;
   342			chan->msg_count = 0;
   343			chan->active_req = MBOX_NO_MSG;
   344			chan->cl = cl;
   345			init_completion(&chan->tx_complete);
   346	
   347			if (chan->txdone_method	== MBOX_TXDONE_BY_POLL && cl->knows_txdone)
   348				chan->txdone_method = MBOX_TXDONE_BY_ACK;
   349		}
   350	
   351		if (chan->mbox->ops->startup) {
   352			ret = chan->mbox->ops->startup(chan);
   353			if (ret) {
   354				dev_err(dev, "Unable to startup the chan (%d)\n", ret);
 > 355				mbox_clean_and_put_channel(chan);
   356				return ret;
   357			}
   358		}
   359	
   360		return 0;
   361	}
   362	
   363	/**
   364	 * mbox_bind_client - Bind client to a mailbox channel.
   365	 * @chan: The mailbox channel to bind the client to.
   366	 * @cl: Identity of the client requesting the channel.
   367	 *
   368	 * The Client specifies its requirements and capabilities while asking for
   369	 * a mailbox channel. It can't be called from atomic context.
   370	 * The channel is exclusively allocated and can't be used by another
   371	 * client before the owner calls mbox_free_channel.
   372	 * After assignment, any packet received on this channel will be
   373	 * handed over to the client via the 'rx_callback'.
   374	 * The framework holds reference to the client, so the mbox_client
   375	 * structure shouldn't be modified until the mbox_free_channel returns.
   376	 *
   377	 * Return: 0 if the channel was assigned to the client successfully.
   378	 *         <0 for request failure.
   379	 */
   380	int mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
   381	{
   382		guard(mutex)(&con_mutex);
   383	
   384		return __mbox_bind_client(chan, cl);
   385	}
   386	EXPORT_SYMBOL_GPL(mbox_bind_client);
   387	
   388	/**
   389	 * mbox_request_channel - Request a mailbox channel.
   390	 * @cl: Identity of the client requesting the channel.
   391	 * @index: Index of mailbox specifier in 'mboxes' property.
   392	 *
   393	 * The Client specifies its requirements and capabilities while asking for
   394	 * a mailbox channel. It can't be called from atomic context.
   395	 * The channel is exclusively allocated and can't be used by another
   396	 * client before the owner calls mbox_free_channel.
   397	 * After assignment, any packet received on this channel will be
   398	 * handed over to the client via the 'rx_callback'.
   399	 * The framework holds reference to the client, so the mbox_client
   400	 * structure shouldn't be modified until the mbox_free_channel returns.
   401	 *
   402	 * Return: Pointer to the channel assigned to the client if successful.
   403	 *		ERR_PTR for request failure.
   404	 */
   405	struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
   406	{
   407		struct fwnode_reference_args fwspec;
   408		struct fwnode_handle *fwnode;
   409		struct mbox_controller *mbox;
   410		struct of_phandle_args spec;
   411		struct mbox_chan *chan;
   412		struct device *dev;
   413		unsigned int i;
   414		int ret;
   415	
   416		dev = cl->dev;
   417		if (!dev) {
   418			pr_debug("No owner device\n");
   419			return ERR_PTR(-ENODEV);
   420		}
   421	
   422		fwnode = dev_fwnode(dev);
   423		if (!fwnode) {
   424			dev_dbg(dev, "No owner fwnode\n");
   425			return ERR_PTR(-ENODEV);
   426		}
   427	
   428		ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
   429							 0, index, &fwspec);
   430		if (ret) {
   431			dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
   432			return ERR_PTR(ret);
   433		}
   434	
   435		spec.np = to_of_node(fwspec.fwnode);
   436		spec.args_count = fwspec.nargs;
   437		for (i = 0; i < spec.args_count; i++)
   438			spec.args[i] = fwspec.args[i];
   439	
   440		scoped_guard(mutex, &con_mutex) {
   441			chan = ERR_PTR(-EPROBE_DEFER);
   442			list_for_each_entry(mbox, &mbox_cons, node) {
   443				if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
   444					if (mbox->fw_xlate) {
   445						chan = mbox->fw_xlate(mbox, &fwspec);
   446						if (!IS_ERR(chan))
   447							break;
   448					} else if (mbox->of_xlate) {
   449						chan = mbox->of_xlate(mbox, &spec);
   450						if (!IS_ERR(chan))
   451							break;
   452					}
   453				}
   454			}
   455	
   456			fwnode_handle_put(fwspec.fwnode);
   457	
   458			if (IS_ERR(chan))
   459				return chan;
   460	
   461			ret = __mbox_bind_client(chan, cl);
   462			if (ret)
   463				chan = ERR_PTR(ret);
   464		}
   465	
   466		return chan;
   467	}
   468	EXPORT_SYMBOL_GPL(mbox_request_channel);
   469	
   470	struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
   471						      const char *name)
   472	{
   473		int index = device_property_match_string(cl->dev, "mbox-names", name);
   474	
   475		if (index < 0) {
   476			dev_err(cl->dev, "%s() could not locate channel named \"%s\"\n",
   477				__func__, name);
   478			return ERR_PTR(index);
   479		}
   480		return mbox_request_channel(cl, index);
   481	}
   482	EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
   483	
 > 484	void mbox_clean_and_put_channel(struct mbox_chan *chan)
   485	{
   486		/* The queued TX requests are simply aborted, no callbacks are made */
   487		scoped_guard(spinlock_irqsave, &chan->lock) {
   488			chan->cl = NULL;
   489			chan->active_req = MBOX_NO_MSG;
   490			if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
   491				chan->txdone_method = MBOX_TXDONE_BY_POLL;
   492		}
   493	
   494		module_put(chan->mbox->dev->driver->owner);
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

