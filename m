Return-Path: <linux-renesas-soc+bounces-6120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F4A906094
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 03:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A3F1C20B80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 01:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB3C51C3E;
	Thu, 13 Jun 2024 01:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iLT72BFf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F36BE7F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jun 2024 01:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718242568; cv=none; b=KGcfNWzmBo1toz7XM0HXAEwjPXERKsChHzKkX51D9iuYMcHwGzD2x0Gjn3UHmdGUqLz54GcoYFDxxproX1XnfX0uH4w0pwPuOyt7UL26ju+b9DKo/liHlnMKNkI5B1MRANRMxHMrpLYj87LrNCxxfq/3gyCXHhjrXOzKZFB885E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718242568; c=relaxed/simple;
	bh=dXGenqrVY8XZ9KNpIs5hgdIGIuNYncZ50HlUbEcsMIk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r3Qyu/4WchdDKD3Wr3M8/beNrufEETdQAEDqcl4NPpdp7esbvaReLB3Jb38Xo/V+Va1LdsYx03LWvhc5wq8MYeAB1Qk64jMO45qQqMIN4TDa109CCG6OW5jwAlwU7JZIzmZ9VuB2HhkyYgB3wio6Ds7p8kuiEIszFh1HPtwv8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iLT72BFf; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfeff072f65so712448276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 18:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718242564; x=1718847364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9Dn29au0+qPLs/80wzlHdbADmvvt55Ei9HbapqAsjk=;
        b=iLT72BFf1j8dVEb7zi7ag0LIG0xlUkTTbIi3JwXPn1juYeMpbAfkwvby6TajnObeRf
         DlHZTBgUmBwfdQFKMiCAKCiQQSyAKZpwn+/ETEq3iWwnJmLDRBYtsVSTTs33TaX0GvTQ
         0kLLzSe5/0hFThAH5BBds5xDZAkWuCCUa2F9VPJs3Bd1z/ggSXtArbWuRYsI6ywv2QCa
         Ja6Zp9UDhoqXgUcpIm3KgZspqkzsiG8zviz6eU6hXJYYpM1UXLaE2M2m4Ysclj1FulhD
         bIpawq1rWDGj1RxOIWKKwGb8+YKaWc2z9UYjsc7bxKQmmbRol5vEJz34LLtH4lT+g5Cj
         x2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718242564; x=1718847364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9Dn29au0+qPLs/80wzlHdbADmvvt55Ei9HbapqAsjk=;
        b=jVciKOMf9OE5ZTV8g8bdRTz09MKiJuF4U5x9EsdYP/lA9zONzdSsOp3+gdXQH731fV
         aq90A265L2ApfOfwrpvgFsn5ZpYO/tOXY6mTxHhHKNr63cChObw0wsYcUyjaghqT+7dI
         1Y0ngrWSg02Aem5lBboszuVTKVNHRgWsppS+N6RJETvz9B3DDlEF0HbyjJ8oq1EFgztq
         fcPoS0EpbpIqF31Mb3SnufKaIvae503PQMyJyEq+cVmdwe1wyuIHrPtNxpKu1gcmXNaf
         /ORP0FykBlmJjoGuCFgpf3UixUoo0KbdgtK1Y0d4lPwxMD7DcfZcdn9Foqr/OitNZ1Jw
         houw==
X-Forwarded-Encrypted: i=1; AJvYcCVNX657MwsdkNPINFGYajS9qLdmj15zDPCZIKcTRBbdlcQH51vP/vqU+tDx1vEScq1VOb6oCuWQWXzIKF3ZkVyH1Ool5ZQe1qULwybJahl4D/c=
X-Gm-Message-State: AOJu0YxJQHefL60YWVOmvNSZ23x//eR+hxo7T9DCFbMUBW7YHfet/C5T
	d69I/Z7SxmQhw4ntflMAF4oXq7hOvGEzPYxEJQwzWDphN2PiOjfpDigJhX9pa/Dck9Rr27Elxwv
	D1VOAEjkaj707YzLcIpt1CA==
X-Google-Smtp-Source: AGHT+IF94SVNrbTHeoIp2FY8sVnQqqn9i0oiamArSh19fvILKJ89RuWOaTiJnOSHNo9Ix4gcaHZ80xVxIllZKHJfBA==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:1008:b0:dfb:168d:c02e with
 SMTP id 3f1490d57ef6-dfe65f7687fmr222006276.3.1718242564147; Wed, 12 Jun 2024
 18:36:04 -0700 (PDT)
Date: Thu, 13 Jun 2024 01:35:39 +0000
In-Reply-To: <20240613013557.1169171-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240613013557.1169171-1-almasrymina@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240613013557.1169171-3-almasrymina@google.com>
Subject: [PATCH net-next v12 02/13] net: netdev netlink api to bind dma-buf to
 a net device
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

API takes the dma-buf fd as input, and binds it to the netdevice. The
user can specify the rx queues to bind the dma-buf to.

Suggested-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v7:
- Use flags: [ admin-perm ] instead of a CAP_NET_ADMIN check.

Changes in v1:
- Add rx-queue-type to distingish rx from tx (Jakub)
- Return dma-buf ID from netlink API (David, Stan)

Changes in RFC-v3:
- Support binding multiple rx rx-queues

---
 Documentation/netlink/specs/netdev.yaml | 53 +++++++++++++++++++++++++
 include/uapi/linux/netdev.h             | 19 +++++++++
 net/core/netdev-genl-gen.c              | 19 +++++++++
 net/core/netdev-genl-gen.h              |  2 +
 net/core/netdev-genl.c                  |  6 +++
 tools/include/uapi/linux/netdev.h       | 19 +++++++++
 6 files changed, 118 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index 959755be4d7f9..899ac0882a098 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -268,6 +268,45 @@ attribute-sets:
         name: napi-id
         doc: ID of the NAPI instance which services this queue.
         type: u32
+  -
+    name: queue-dmabuf
+    attributes:
+      -
+        name: type
+        doc: rx or tx queue
+        type: u8
+        enum: queue-type
+      -
+        name: idx
+        doc: queue index
+        type: u32
+
+  -
+    name: bind-dmabuf
+    attributes:
+      -
+        name: ifindex
+        doc: netdev ifindex to bind the dma-buf to.
+        type: u32
+        checks:
+          min: 1
+      -
+        name: queues
+        doc: receive queues to bind the dma-buf to.
+        type: nest
+        nested-attributes: queue-dmabuf
+        multi-attr: true
+      -
+        name: dmabuf-fd
+        doc: dmabuf file descriptor to bind.
+        type: u32
+      -
+        name: dmabuf-id
+        doc: id of the dmabuf binding
+        type: u32
+        checks:
+          min: 1
+
 
   -
     name: qstats
@@ -579,6 +618,20 @@ operations:
           attributes:
             - ifindex
         reply: *queue-get-op
+    -
+      name: bind-rx
+      doc: Bind dmabuf to netdev
+      attribute-set: bind-dmabuf
+      flags: [ admin-perm ]
+      do:
+        request:
+          attributes:
+            - ifindex
+            - dmabuf-fd
+            - queues
+        reply:
+          attributes:
+            - dmabuf-id
     -
       name: napi-get
       doc: Get information about NAPI instances configured on the system.
diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 43742ac5b00da..190a504a62358 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -136,6 +136,24 @@ enum {
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
 };
 
+enum {
+	NETDEV_A_QUEUE_DMABUF_TYPE = 1,
+	NETDEV_A_QUEUE_DMABUF_IDX,
+
+	__NETDEV_A_QUEUE_DMABUF_MAX,
+	NETDEV_A_QUEUE_DMABUF_MAX = (__NETDEV_A_QUEUE_DMABUF_MAX - 1)
+};
+
+enum {
+	NETDEV_A_BIND_DMABUF_IFINDEX = 1,
+	NETDEV_A_BIND_DMABUF_QUEUES,
+	NETDEV_A_BIND_DMABUF_DMABUF_FD,
+	NETDEV_A_BIND_DMABUF_DMABUF_ID,
+
+	__NETDEV_A_BIND_DMABUF_MAX,
+	NETDEV_A_BIND_DMABUF_MAX = (__NETDEV_A_BIND_DMABUF_MAX - 1)
+};
+
 enum {
 	NETDEV_A_QSTATS_IFINDEX = 1,
 	NETDEV_A_QSTATS_QUEUE_TYPE,
@@ -184,6 +202,7 @@ enum {
 	NETDEV_CMD_PAGE_POOL_CHANGE_NTF,
 	NETDEV_CMD_PAGE_POOL_STATS_GET,
 	NETDEV_CMD_QUEUE_GET,
+	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_GET,
 	NETDEV_CMD_QSTATS_GET,
 
diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
index 8350a0afa9ec7..9acd0d893765a 100644
--- a/net/core/netdev-genl-gen.c
+++ b/net/core/netdev-genl-gen.c
@@ -27,6 +27,11 @@ const struct nla_policy netdev_page_pool_info_nl_policy[NETDEV_A_PAGE_POOL_IFIND
 	[NETDEV_A_PAGE_POOL_IFINDEX] = NLA_POLICY_FULL_RANGE(NLA_U32, &netdev_a_page_pool_ifindex_range),
 };
 
+const struct nla_policy netdev_queue_dmabuf_nl_policy[NETDEV_A_QUEUE_DMABUF_IDX + 1] = {
+	[NETDEV_A_QUEUE_DMABUF_TYPE] = NLA_POLICY_MAX(NLA_U8, 1),
+	[NETDEV_A_QUEUE_DMABUF_IDX] = { .type = NLA_U32, },
+};
+
 /* NETDEV_CMD_DEV_GET - do */
 static const struct nla_policy netdev_dev_get_nl_policy[NETDEV_A_DEV_IFINDEX + 1] = {
 	[NETDEV_A_DEV_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
@@ -58,6 +63,13 @@ static const struct nla_policy netdev_queue_get_dump_nl_policy[NETDEV_A_QUEUE_IF
 	[NETDEV_A_QUEUE_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
 };
 
+/* NETDEV_CMD_BIND_RX - do */
+static const struct nla_policy netdev_bind_rx_nl_policy[NETDEV_A_BIND_DMABUF_DMABUF_FD + 1] = {
+	[NETDEV_A_BIND_DMABUF_IFINDEX] = NLA_POLICY_MIN(NLA_U32, 1),
+	[NETDEV_A_BIND_DMABUF_DMABUF_FD] = { .type = NLA_U32, },
+	[NETDEV_A_BIND_DMABUF_QUEUES] = NLA_POLICY_NESTED(netdev_queue_dmabuf_nl_policy),
+};
+
 /* NETDEV_CMD_NAPI_GET - do */
 static const struct nla_policy netdev_napi_get_do_nl_policy[NETDEV_A_NAPI_ID + 1] = {
 	[NETDEV_A_NAPI_ID] = { .type = NLA_U32, },
@@ -130,6 +142,13 @@ static const struct genl_split_ops netdev_nl_ops[] = {
 		.maxattr	= NETDEV_A_QUEUE_IFINDEX,
 		.flags		= GENL_CMD_CAP_DUMP,
 	},
+	{
+		.cmd		= NETDEV_CMD_BIND_RX,
+		.doit		= netdev_nl_bind_rx_doit,
+		.policy		= netdev_bind_rx_nl_policy,
+		.maxattr	= NETDEV_A_BIND_DMABUF_DMABUF_FD,
+		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
+	},
 	{
 		.cmd		= NETDEV_CMD_NAPI_GET,
 		.doit		= netdev_nl_napi_get_doit,
diff --git a/net/core/netdev-genl-gen.h b/net/core/netdev-genl-gen.h
index 4db40fd5b4a9e..ca5a0983f2834 100644
--- a/net/core/netdev-genl-gen.h
+++ b/net/core/netdev-genl-gen.h
@@ -13,6 +13,7 @@
 
 /* Common nested types */
 extern const struct nla_policy netdev_page_pool_info_nl_policy[NETDEV_A_PAGE_POOL_IFINDEX + 1];
+extern const struct nla_policy netdev_queue_dmabuf_nl_policy[NETDEV_A_QUEUE_DMABUF_IDX + 1];
 
 int netdev_nl_dev_get_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_dev_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
@@ -26,6 +27,7 @@ int netdev_nl_page_pool_stats_get_dumpit(struct sk_buff *skb,
 int netdev_nl_queue_get_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_queue_get_dumpit(struct sk_buff *skb,
 			       struct netlink_callback *cb);
+int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_napi_get_doit(struct sk_buff *skb, struct genl_info *info);
 int netdev_nl_napi_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb);
 int netdev_nl_qstats_get_dumpit(struct sk_buff *skb,
diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
index 1f6ae6379e0fc..e254503723626 100644
--- a/net/core/netdev-genl.c
+++ b/net/core/netdev-genl.c
@@ -721,6 +721,12 @@ int netdev_nl_qstats_get_dumpit(struct sk_buff *skb,
 	return err;
 }
 
+/* Stub */
+int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
+{
+	return 0;
+}
+
 static int netdev_genl_netdevice_event(struct notifier_block *nb,
 				       unsigned long event, void *ptr)
 {
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 43742ac5b00da..190a504a62358 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -136,6 +136,24 @@ enum {
 	NETDEV_A_QUEUE_MAX = (__NETDEV_A_QUEUE_MAX - 1)
 };
 
+enum {
+	NETDEV_A_QUEUE_DMABUF_TYPE = 1,
+	NETDEV_A_QUEUE_DMABUF_IDX,
+
+	__NETDEV_A_QUEUE_DMABUF_MAX,
+	NETDEV_A_QUEUE_DMABUF_MAX = (__NETDEV_A_QUEUE_DMABUF_MAX - 1)
+};
+
+enum {
+	NETDEV_A_BIND_DMABUF_IFINDEX = 1,
+	NETDEV_A_BIND_DMABUF_QUEUES,
+	NETDEV_A_BIND_DMABUF_DMABUF_FD,
+	NETDEV_A_BIND_DMABUF_DMABUF_ID,
+
+	__NETDEV_A_BIND_DMABUF_MAX,
+	NETDEV_A_BIND_DMABUF_MAX = (__NETDEV_A_BIND_DMABUF_MAX - 1)
+};
+
 enum {
 	NETDEV_A_QSTATS_IFINDEX = 1,
 	NETDEV_A_QSTATS_QUEUE_TYPE,
@@ -184,6 +202,7 @@ enum {
 	NETDEV_CMD_PAGE_POOL_CHANGE_NTF,
 	NETDEV_CMD_PAGE_POOL_STATS_GET,
 	NETDEV_CMD_QUEUE_GET,
+	NETDEV_CMD_BIND_RX,
 	NETDEV_CMD_NAPI_GET,
 	NETDEV_CMD_QSTATS_GET,
 
-- 
2.45.2.505.gda0bf45e8d-goog


