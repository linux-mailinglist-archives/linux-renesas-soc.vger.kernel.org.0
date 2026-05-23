Return-Path: <linux-renesas-soc+bounces-33049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDubCFqAEWo4mwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 12:24:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095B5BE7CB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 12:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96942300AB37
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2026 10:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E218B36C9EE;
	Sat, 23 May 2026 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIm+gfDj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9593225B0AA;
	Sat, 23 May 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779531862; cv=none; b=XjJ45lSy1bu7LM2uwWkLNoNm3Ni5Knt9KkR6s+BLKasvvxNxjjl3EI5O7wnxRSKzfbic76DHJEavLHS+Dr2PgS5OeqBTYiGGV7veTI7D5uMRmcStnpPDleuCrduxEaKhuuEjsAMp35qQREMM8gONJPQFQ93mu2WjQhSXoxqfZss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779531862; c=relaxed/simple;
	bh=0x2rke5RIqPZSgpGaIjEtadUjZ5HFFBTUC5A4Oj0z1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhGU0wW7NyXvvGVN5vL0lyTXy3NIL/hIkUT+7sbiW6Hpuv1ZE1KYn8zWoDVNFXkAPqEyVmkITZuhsR9PPz1cqaSFDTGTYFO674lmXgJHyU/8bECyXVVNLDW9hA5BCzSnea8uiOPdWjY/czczQEuM6AtH6VC0Dia+LSlwYfE/Ey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIm+gfDj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4C61F000E9;
	Sat, 23 May 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779531861;
	bh=peRX6KbtQwwo/CDCYbvV6ceGBLh4Cr86lEYE8/dweaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dIm+gfDjJOZ7mmLyYMVqbRm0MJk9FOuVRd8ctIAvZSmwqwtLoLIuZfrjsT9gZNTui
	 IWtGpbLn1gqs4g4S5qkiN7lHtn1irR4ShoThMogQz9C/iWFjPQQzFiERc16LCSnDOy
	 i4KmdwKIPB2wY6DRe0MsEue54hwFnkH4p1bj/KdMcGgi4NmjudtucRYX5PBnCtn9ds
	 +rMBkeJd9OXxP0OJuCBppmGQ4EZvAsQrhs7KJfvIQUd4eP17iW55huRURuyb8Mu3jZ
	 Nr8pq4qoW5rEWdNPj2+hMyW7CyQCHMNKcdGuwmWIEdg5roUGiTlHgKaaxqRgTOo8uV
	 wcx1jasnILnQQ==
Message-ID: <df2d27a3-c349-4aa4-b897-e9dc3418b2c0@kernel.org>
Date: Sat, 23 May 2026 13:24:15 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] i3c: renesas: Reset the controller on resume
To: Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-7-claudiu.beznea@kernel.org>
 <ahCrOed9QpKR5ZRF@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ahCrOed9QpKR5ZRF@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33049-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7095B5BE7CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/26 22:15, Frank Li wrote:
> On Fri, May 22, 2026 at 01:18:04PM +0300, Claudiu Beznea wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Reset the controller on resume after enabling the clocks to follow the
>> same sequence as in probe and avoid potential ordering related failures.
>>
>> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
> 
> Can you move these similar stuff to one helper function to avoid duplicate
> efforts later?

If you are talking about moving also the control of the reset signals in the 
renesas_i3c_reset() I can do that, but, FMPOV, it will complicate the code, 
especially the initialization and failure paths (see the above diff built on top 
of this series).

Moving the reset de-assert in the renesas_i3c_reset() will involve calling 
functions to assert back the resets in case of failure. FMPOV, that is a bit 
unbalanced (wrt the way the code looks) because we are calling deassert in one 
function and assert in another function. It is a bit difficult to follow.

Please see the above diff and let me know your thoughts.


diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 3b9807a89b54..5f45a024aa54 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -255,8 +255,7 @@ struct renesas_i3c_xferqueue {
  struct renesas_i3c {
         void __iomem *regs;
         struct clk *tclk;
-       struct reset_control *presetn;
-       struct reset_control *tresetn;
+       struct reset_control_bulk_data *resets;
         struct device *dev;
         int *irqs;
         struct renesas_i3c_xferqueue xferqueue;
@@ -264,6 +263,7 @@ struct renesas_i3c {
         unsigned long rate;
         unsigned int num_irqs;
         enum i3c_internal_state internal_state;
+       u32 num_resets;
         u32 free_pos;
         u32 dyn_addr;
         u32 i2c_STDBR;
@@ -492,16 +492,28 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
         u32 val;
         int ret;

+       ret = reset_control_bulk_deassert(i3c->num_resets, i3c->resets);
+       if (ret)
+               return ret;
+
         PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
         ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
         if (ret)
-               return ret;
+               goto assert;

         renesas_writel(i3c->regs, BCTL, 0);
         renesas_set_bit(i3c->regs, RSTCTL, RSTCTL_RI3CRST);

-       return read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
-                                0, 1000, false, i3c->regs, RSTCTL);
+       ret = read_poll_timeout(renesas_readl, val, !(val & RSTCTL_RI3CRST),
+                               0, 1000, false, i3c->regs, RSTCTL);
+       if (ret)
+               goto assert;
+
+       return 0;
+
+assert:
+       reset_control_bulk_assert(i3c->num_resets, i3c->resets);
+       return ret;
  }

  static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
@@ -1430,11 +1442,20 @@ static const struct renesas_i3c_irq_desc 
renesas_i3c_irqs[] = {
         { .name = "nack", .isr = renesas_i3c_tend_isr, .desc = "i3c-nack" },
  };

+static const char * const renesas_i3c_resets[] = { "tresetn", "presetn" };
+
  static void renesas_i3c_dont_use_autosuspend(void *data)
  {
         pm_runtime_dont_use_autosuspend(data);
  }

+static void renesas_i3c_resets_assert(void *data)
+{
+       struct renesas_i3c *i3c = data;
+
+       reset_control_bulk_assert(i3c->num_resets, i3c->resets);
+}
+
  static int renesas_i3c_probe(struct platform_device *pdev)
  {
         struct renesas_i3c *i3c;
@@ -1464,15 +1485,20 @@ static int renesas_i3c_probe(struct platform_device *pdev)
         if (ret)
                 return ret;

-       i3c->tresetn = 
devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
-       if (IS_ERR(i3c->tresetn))
-               return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
-                                    "Error: missing tresetn ctrl\n");
+       i3c->num_resets = ARRAY_SIZE(renesas_i3c_resets);
+       i3c->resets = devm_kmalloc_array(&pdev->dev, i3c->num_resets,
+                                        sizeof(*i3c->resets), GFP_KERNEL);
+       if (!i3c->resets)
+               return -ENOMEM;

-       i3c->presetn = 
devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
-       if (IS_ERR(i3c->presetn))
-               return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
-                                    "Error: missing presetn ctrl\n");
+       for (unsigned int i = 0; i < i3c->num_resets; i++)
+               i3c->resets[i].id = renesas_i3c_resets[i];
+
+       ret = devm_reset_control_bulk_get_optional_exclusive(&pdev->dev,
+                                                            i3c->num_resets,
+                                                            i3c->resets);
+       if (ret)
+               return ret;

         spin_lock_init(&i3c->xferqueue.lock);
         INIT_LIST_HEAD(&i3c->xferqueue.list);
@@ -1481,6 +1507,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
         if (ret)
                 return ret;

+       /* Add devm action for resets deasserted in renesas_i3c_reset(). */
+       ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_resets_assert, NULL);
+       if (ret)
+               return ret;
+
         i3c->num_irqs = ARRAY_SIZE(renesas_i3c_irqs);
         i3c->irqs = devm_kcalloc(&pdev->dev, i3c->num_irqs, sizeof(*i3c->irqs), 
GFP_KERNEL);
         if (!i3c->irqs)
@@ -1523,15 +1554,11 @@ static void renesas_i3c_remove(struct platform_device *pdev)
  static int renesas_i3c_suspend(struct device *dev)
  {
         struct renesas_i3c *i3c = dev_get_drvdata(dev);
-       struct reset_control_bulk_data resets[] = {
-               { .rstc = i3c->presetn },
-               { .rstc = i3c->tresetn },
-       };
         int ret;

         i2c_mark_adapter_suspended(&i3c->base.i2c);

-       ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+       ret = reset_control_bulk_assert(i3c->num_resets, i3c->resets);
         if (ret)
                 goto err_mark_resumed;

@@ -1542,7 +1569,7 @@ static int renesas_i3c_suspend(struct device *dev)
         return 0;

  err_resets_deassert:
-       reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
+       reset_control_bulk_deassert(i3c->num_resets, i3c->resets);
  err_mark_resumed:
         i2c_mark_adapter_resumed(&i3c->base.i2c);

@@ -1552,23 +1579,15 @@ static int renesas_i3c_suspend(struct device *dev)
  static int renesas_i3c_resume(struct device *dev)
  {
         struct renesas_i3c *i3c = dev_get_drvdata(dev);
-       struct reset_control_bulk_data resets[] = {
-               { .rstc = i3c->presetn },
-               { .rstc = i3c->tresetn },
-       };
         int ret;

         ret = pm_runtime_force_resume(dev);
         if (ret)
                 return ret;

-       ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
-       if (ret)
-               return ret;
-
         ret = renesas_i3c_reset(i3c);
         if (ret)
-               goto err_resets_asserted;
+               return ret;

         PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(i3c->dev, pm);
         ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
@@ -1607,7 +1626,7 @@ static int renesas_i3c_resume(struct device *dev)
          * if a runtime path is triggered after a failed resume). Checked on
          * RZ/G3S.
          */
-       reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+       reset_control_bulk_assert(i3c->num_resets, i3c->resets);
         return ret;
  }

-- 
Thank you,
Claudiu


