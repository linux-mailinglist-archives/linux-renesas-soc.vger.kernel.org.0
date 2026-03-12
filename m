Return-Path: <linux-renesas-soc+bounces-29265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIseGEaNsmkQNgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 10:54:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1726FE98
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 10:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73D9F3017304
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 09:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C907D3BB9EF;
	Thu, 12 Mar 2026 09:54:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DC73AD51B;
	Thu, 12 Mar 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309244; cv=none; b=ghdcvLKx29s/zD0F39bK3YqaDFUIMgkHin237+xSpYpKfPEJjPi9v15uifubMMG1Z4vdGk5VUcViU99A0U6n0+PjclDoWTtwTqBsGSqKKZSmk92dn1dhn1moHqfxoFX/jpnnTPugPNBMGeGoXFqv0BBsAKDLbums9MsG/7jL2/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309244; c=relaxed/simple;
	bh=lHZVhCzulzdzkAtiVdpksnpGYjt4BLJ/buQ/uz/EETg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqxv4fV6N/Z8+LDMDjExn12QOPw4UjXjkEcvu7tgmc/VhOaGWb1YlUwwWDh7R/SaAZXfxWPoQjfGEFwkCJL7PeqJOJooNypCZMwM/rlmjPxCSt+sDmB3sFHpWn9iULwuXnA8prtcYHfSHt0xktkX2Z4uVlJ31+//ryEZZSD2i0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27515C19424;
	Thu, 12 Mar 2026 09:54:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] PM: domains: Call pm_runtime_barrier() before dev_pm_domain_{attach*,detach}()
Date: Thu, 12 Mar 2026 10:53:39 +0100
Message-ID: <15510cee649959281d9554965cacd0c06531c1f3.1773308898.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29265-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.984];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 90B1726FE98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If a device has multiple PM Domains, dev_pm_domain_detach() is called
multiple times on unbind or probe failure.  If the PM Domain is also a
Clock Domain, and thus calls pm_clk_destroy() from its .detach()
callback, dev_pm_put_subsys_data() will set dev->power.subsys_data to
NULL when psd->refcount reaches zero.

Later/in parallel, default_suspend_ok() calls dev_gpd_data():

    static inline struct generic_pm_domain_data *dev_gpd_data(struct device *dev)
    {
	    return to_gpd_data(dev->power.subsys_data->domain_data);
    }

which may trigger a NULL pointer dereference.

All dev_pm_domain_{at,de}tach*() functions document that callers must
ensure proper synchronization of these functions with power management
callbacks.  Unfortunately no callers seem to actually do so.  This
includes dev_pm_domain_attach_list() and dev_pm_domain_detach_list():
they call dev_pm_domain_{attach*,detach}() internally, which means they
should take care of this synchronization themselves.

Add synchronization to dev_pm_domain_{at,de}tach_list() by calling
pm_runtime_barrier() before dev_pm_domain_{attach*,detach}(), and drop
the now obsolete comments.

Suggested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This issue was reported first in "drm/imagination:
genpd_runtime_suspend() crash"[1] and "Re: [PATCH 2/5] arm64: dts:
renesas: r8a77960-salvator-x: Enable GPU support"[2].
Unfortunately this patch does not fix the issue for good, it just
becomes much harder to trigger (like needing tens of thousands of
tries).

How to trigger:

  1. Check out drm-next[3]

  2. Enable the gpu node in one of the following DTS files, depending on
     your board (Salvator-X(S), ULCB, or Falcon):

	 arch/arm64/boot/dts/renesas/r8a77960.dtsi
	 arch/arm64/boot/dts/renesas/r8a77961.dtsi
	 arch/arm64/boot/dts/renesas/r8a77965.dtsi
	 arch/arm64/boot/dts/renesas/r8a779a0.dtsi

     These nodes are not yet enabled in any board DTS because of this
     crash.

  3. Build and boot a kernel using renesas_defconfig[4]

  4. The PowerVR driver will fail to probe (since [5], which is IMHO a
     regression):

	 powervr fd000000.gpu: [drm] *ERROR* Unknown GPU! Set 'exp_hw_support' to bypass this check.

  5. Try to bind the driver again:

      $ for i in $(seq 1000000); do echo $i; echo fd000000.gpu > /sys/bus/platform/drivers/powervr/bind; done

     Eventually, the kernel will crash:

         [...]
         powervr fd000000.gpu: [drm] *ERROR* Unknown GPU! Set 'exp_hw_support' to bypass this check.
         Unable to handle kernel NULL pointer dereference at virtual address 0000000000000040
         Mem abort info:
           ESR = 0x0000000096000004
           EC = 0x25: DABT (current EL), IL = 32 bits
           SET = 0, FnV = 0
           EA = 0, S1PTW = 0
           FSC = 0x04: level 0 translation fault
         Data abort info:
           ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
           CM = 0, WnR = 0, TnD = 0, TagAccess = 0
           GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
         user pgtable: 4k pages, 48-bit VAs, pgdp=0000000049993000
         [0000000000000040] pgd=0000000000000000, p4d=0000000000000000
         Internal error: Oops: 0000000096000004 [#1]  SMP
         CPU: 1 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted 7.0.0-rc2-arm64-renesas-00540-g5f0a63f81a02-dirty #3502 PREEMPT
         Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
         Workqueue: pm pm_runtime_work
         pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
         pc : genpd_runtime_suspend+0x134/0x28c
         lr : genpd_runtime_suspend+0x124/0x28c
         sp : ffff80008174bc50
         x29: ffff80008174bc50 x28: 0000000000000000 x27: 0000000000000000
         x26: 0000003ca1f7104b x25: ffff0000090ba580 x24: ffff00000e7d92a0
         x23: ffff0000081612f8 x22: 0000000000000001 x21: ffff000008161000
         x20: 0000000000000000 x19: ffff00000b6ef400 x18: 0000000000000000
         x17: 0000000000000000 x16: 0000000000000000 x15: ffff000008065600
         x14: 0000000000000058 x13: ffff0000080254e0 x12: 0000000000000000
         x11: ffff000008065608 x10: 00000000001343d0 x9 : ffff0000080656c0
         x8 : ffff000008161800 x7 : 000001f3fffffc18 x6 : 0000000000000000
         x5 : ffff000008161c10 x4 : 0000000000000000 x3 : 0000000000000000
         x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
         Call trace:
          genpd_runtime_suspend+0x134/0x28c (P)
          __rpm_callback+0x44/0x1cc
          rpm_callback+0x6c/0x78
          rpm_suspend+0x108/0x564
          pm_runtime_work+0xb8/0xbc
          process_one_work+0x144/0x280
          worker_thread+0x180/0x2f8
          kthread+0x114/0x120
          ret_from_fork+0x10/0x20
         Code: d503201f f940fe60 52800002 f9410e61 (f9402003)
         ---[ end trace 0000000000000000 ]---

The issue is easier to trigger, and may prevent the kernel from booting
at all, by adding extra debug prints like:

    diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
    index 52ea84e548ff6d27..2fe666c2170194ab 100644
    --- a/drivers/pmdomain/core.c
    +++ b/drivers/pmdomain/core.c
    @@ -256,12 +256,14 @@ struct device *dev_to_genpd_dev(struct device *dev)
     static int genpd_stop_dev(const struct generic_pm_domain *genpd,
			      struct device *dev)
     {
    +pr_info("==== %s/%s: stop\n", genpd->name, dev_name(dev));
	    return GENPD_DEV_CALLBACK(genpd, int, stop, dev);
     }

     static int genpd_start_dev(const struct generic_pm_domain *genpd,
			       struct device *dev)
     {
    +pr_info("==== %s/%s: start\n", genpd->name, dev_name(dev));
	    return GENPD_DEV_CALLBACK(genpd, int, start, dev);
     }

Thanks for your comments and suggestions!

[1] https://lore.kernel.org/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com
[2] https://lore.kernel.org/CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com/
[3] commit 5f0a63f81a027bec ("Merge tag 'drm-misc-next-2026-03-05' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next")
[4] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/tree/arch/arm64/configs/renesas_defconfig?h=topic/renesas-defconfig
[5] commit 1c21f240fbc1e47b ("drm/imagination: Warn or error on unsupported hardware") in v7.0-rc1
---
 drivers/base/power/common.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index 9bef9248a70529bf..af690ce38ac3a086 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
 
 #include "power.h"
 
@@ -183,9 +184,6 @@ EXPORT_SYMBOL_GPL(dev_pm_domain_attach_by_name);
  * may also provide an empty list, in case the attach should be done for all of
  * the available PM domains.
  *
- * Callers must ensure proper synchronization of this function with power
- * management callbacks.
- *
  * Returns the number of attached PM domains or a negative error code in case of
  * a failure. Note that, to detach the list of PM domains, the driver shall call
  * dev_pm_domain_detach_list(), typically during the remove phase.
@@ -240,6 +238,7 @@ int dev_pm_domain_attach_list(struct device *dev,
 		link_flags |= DL_FLAG_RPM_ACTIVE;
 
 	for (i = 0; i < num_pds; i++) {
+		pm_runtime_barrier(dev);
 		if (by_id)
 			pd_dev = dev_pm_domain_attach_by_id(dev, i);
 		else
@@ -284,12 +283,14 @@ int dev_pm_domain_attach_list(struct device *dev,
 
 err_link:
 	dev_pm_opp_clear_config(pds->opp_tokens[i]);
+	pm_runtime_barrier(pd_dev);
 	dev_pm_domain_detach(pd_dev, true);
 err_attach:
 	while (--i >= 0) {
 		dev_pm_opp_clear_config(pds->opp_tokens[i]);
 		if (pds->pd_links[i])
 			device_link_del(pds->pd_links[i]);
+		pm_runtime_barrier(pds->pd_devs[i]);
 		dev_pm_domain_detach(pds->pd_devs[i], true);
 	}
 	kfree(pds->pd_devs);
@@ -370,9 +371,6 @@ EXPORT_SYMBOL_GPL(dev_pm_domain_detach);
  *
  * This function reverse the actions from dev_pm_domain_attach_list().
  * Typically it should be invoked during the remove phase from drivers.
- *
- * Callers must ensure proper synchronization of this function with power
- * management callbacks.
  */
 void dev_pm_domain_detach_list(struct dev_pm_domain_list *list)
 {
@@ -385,6 +383,7 @@ void dev_pm_domain_detach_list(struct dev_pm_domain_list *list)
 		dev_pm_opp_clear_config(list->opp_tokens[i]);
 		if (list->pd_links[i])
 			device_link_del(list->pd_links[i]);
+		pm_runtime_barrier(list->pd_devs[i]);
 		dev_pm_domain_detach(list->pd_devs[i], true);
 	}
 
-- 
2.43.0


