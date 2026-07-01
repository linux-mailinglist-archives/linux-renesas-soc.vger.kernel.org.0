Return-Path: <linux-renesas-soc+bounces-34626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pyXELWNKRWqj+AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 19:12:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0AF6F0342
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 19:12:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AOZxBODk;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3FD9302A9F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 17:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF18F38239B;
	Wed,  1 Jul 2026 17:12:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99329DB6C;
	Wed,  1 Jul 2026 17:12:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925921; cv=none; b=gXFRV/F1LG1cdXkLTuhpyv5HNCqTnLyoVt27i7ul7mwROB2rr8NOB8Er5Xzz6kOHNIAUDB//u/NestmxQv6rkbvdjU2fE4yFV4vnb1zPLr1/JB9UddJhmh6t0XFGIVyGIGaI8//DscR8GERT0Rfo8aqkKU49MNeumSEMSi7+ovY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925921; c=relaxed/simple;
	bh=IYHibe3w/Usi8wZ+YbVavZuRMScTW7qDRzO5RLcfSlM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rnbpnogQ1nUtPP5Nd/iRZVHYvi58X105jH6qHqE6VkTm43rwQFg5pqBOEaANHUE39a0pfLh8MWcKLebhnE917RLyzdiCT2oCjmQFidNC2fqyGP6LOOVZPoj6GW0MEPitvU5AFCJiZ7EuOGa4naWz6Jd0lJQgJO0RL/JjtjV+u9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOZxBODk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF191F000E9;
	Wed,  1 Jul 2026 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925920;
	bh=N8IvyApca3rIZ+G3IaiQJxW6To6JY2BREwgZjIj25gY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AOZxBODkICJ+Fy6V7cpnDvxOfv/VlHsWrP5biXXMGaDirktH6tiNnaKrHVoOhaEil
	 AYaMPSOBiuJB1diCbMH4rA1njNgEmd4hfd7LQu60RaA1f2AGDPhBx818hFFPYbDWfc
	 PdYGoi1OOt/0lB1MA2phAEN78bvQysvnz0ONvCyeKDZeGD0yxEBQ5Vz+aTBtVM2+xc
	 yzY9EeEWZQzld5AZITQC0EOudFKFdix5RPPE68u9XMTz++ZZwtglK0X1TGgZGCK+QH
	 MC8BffKNEnb7QJz0CZwKRBLC48hXc5F5DPvc5aZyAdSuMwLSuhSj4B/h/JOylSVcl2
	 HuwVOODRaMaUA==
Date: Wed, 1 Jul 2026 13:11:57 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Carlier <devnexen@gmail.com>, linux-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Vineeth Pillai (Google)"
 <vineeth@bitbyteword.org>, Peter Zijlstra <peterz@infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep
 rcu_is_watching() check to trace_##name##_enabled()
Message-ID: <20260701131157.3fc4c695@robin>
In-Reply-To: <CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
References: <20260522143508.298439732@kernel.org>
	<20260522143525.551205135@kernel.org>
	<CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
	<20260630155318.7db20990@gandalf.local.home>
	<CAMuHMdUdsTHCMnitVEHdZvRFe9xgmLLTjSr=QqvOi0dxFjkTEA@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34626-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,arm.com,efficios.com,linux-foundation.org,bitbyteword.org,infradead.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:devnexen@gmail.com,m:linux-kernel@vger.kernel.org,m:mhiramat@kernel.org,m:mark.rutland@arm.com,m:mathieu.desnoyers@efficios.com,m:akpm@linux-foundation.org,m:vineeth@bitbyteword.org,m:peterz@infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rostedt@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C0AF6F0342

On Wed, 1 Jul 2026 11:24:31 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Thanks, it does not trigger with the commit reverted and the "echo 1 > ...".

Ah found the issue;

#define trace(point, args)                                      \
        do {                                                    \
                if (trace_##point##_enabled()) {                \
                        bool exit_rcu = false;                  \
                        if (in_nmi())                           \
                                break;                          \
                        if (!IS_ENABLED(CONFIG_TINY_RCU) &&     \
                            is_idle_task(current)) {            \
                                ct_irq_enter();                 \
                                exit_rcu = true;                \
                        }                                       \
                        trace_##point(args);                    \
                        if (exit_rcu)                           \
                                ct_irq_exit();                  \
                }                                               \
        } while (0)
#endif

The code within the enabled() call checks if RCU is watching, and if
not, it makes it watch. So yeah, this is a special case.

The following patch should fix the issue:

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 4a0c36f40fe2..e0d838c9ce93 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -292,13 +292,18 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	{								\
 	}								\
 	static inline bool						\
+	__trace_##name##_enabled(void)					\
+	{								\
+		return static_branch_unlikely(&__tracepoint_##name.key);\
+	}								\
+	static inline bool						\
 	trace_##name##_enabled(void)					\
 	{								\
 		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
 			WARN_ONCE(!rcu_is_watching(),			\
 				  "RCU not watching for tracepoint");	\
 		}							\
-		return static_branch_unlikely(&__tracepoint_##name.key);\
+		return __trace_##name##_enabled();			\
 	}
 
 #define __DECLARE_TRACE(name, proto, args, cond, data_proto)			\
@@ -457,6 +462,11 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	{								\
 	}								\
 	static inline bool						\
+	__trace_##name##_enabled(void)					\
+	{								\
+		return false;						\
+	}								\
+	static inline bool						\
 	trace_##name##_enabled(void)					\
 	{								\
 		return false;						\
diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
index 0c42b15c3800..b63e3558948f 100644
--- a/kernel/trace/trace_preemptirq.c
+++ b/kernel/trace/trace_preemptirq.c
@@ -30,7 +30,7 @@
 #else
 #define trace(point, args)					\
 	do {							\
-		if (trace_##point##_enabled()) {		\
+		if (__trace_##point##_enabled()) {		\
 			bool exit_rcu = false;			\
 			if (in_nmi())				\
 				break;				\

