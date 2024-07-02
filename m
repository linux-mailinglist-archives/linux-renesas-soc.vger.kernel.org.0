Return-Path: <linux-renesas-soc+bounces-7009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4B99249C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 23:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5FED284CDF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 21:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8F820125E;
	Tue,  2 Jul 2024 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="USGu5/TF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44E20012E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jul 2024 21:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719954528; cv=none; b=rjCOfvSCRgY2kmudOKEad/qVwHv/+zkGSPT9YNqF6dskdFIbcB3XMfxgmj1PV9pKe6RNoRG2CX7pKOyS5axYGMlqCWGZf+TqwU17anKgLb1mg2oGGFaMu9LYZZqqcE5Zcu1rfUAuQCwX+77v6Y55r4vG3Kr8OJEn0WS83Qg0LAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719954528; c=relaxed/simple;
	bh=iQAoLd3zEtpYYbvVSah/d8jhIfMBMAETp2gljBGBXRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXINhGM0SrOQHlwcWK6RK9kdtrZC15A0wDBLSdrGAOv/ucXfPTc93W+vfE8GSOWFWnv5ILM7xV2tseNSyjXu0k4MfOjyhjMFhGU3usHKxylNrhQ30MmUO8tAPplXpyWOKir+bGC78oSdRZ3U5B6auXbZzl6xA7JoFFeuNYL8xK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=USGu5/TF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719954525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=se85jQN04juZgRCOlUB8db7Xj7Z+u0P5SXHucncyZCM=;
	b=USGu5/TF/N8oxDOc7HC2R1AMyHISh0rOWiavnXekE4PXi6djxWL5MWAs8qBIfLf5f/p3IN
	gP6QqsbabsrcMexxkZwbHEwWyRh1H7m1DiPXN/Ss9km34D15PWGAeEfCzDaRfpDzOMEOXt
	5MpjtZNi1yJfQQmi9TaJrsflpvq2Rek=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-B5hGCg1rNoyLbCNeBw4fLw-1; Tue, 02 Jul 2024 17:08:44 -0400
X-MC-Unique: B5hGCg1rNoyLbCNeBw4fLw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43fb02db6d2so57581901cf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jul 2024 14:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719954524; x=1720559324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=se85jQN04juZgRCOlUB8db7Xj7Z+u0P5SXHucncyZCM=;
        b=JCfSf+I4EXjOzT9IT0MWizN2mP+3qs2kjKG7CHwUKyZ9oeLptQwrvzFL4k8IXompVk
         s7qszO0Pb/76w+ZmvwNN5X4kqVopU7J4k9By+ORNynbpi6XS6l7K3Q0gPpXn5m6lZTyY
         GLA/BQIkNVvdyqKoRcgNeVnCPWwI4sEM32AkFc1efacNh1hYpv2C1epMX6y7tu2FxrW9
         h1Hc0VhWeSIEIuB+tGRBjXvp798y5EVjxLjCj3OKyAwTDTRekwSB46qgH3mjCckFhJOV
         XDhzUsI+5ExTvd9wqoF80jkWaMX/eO+n9xMQey17dz4mRSlzLshK9pkLi9x0wuucU2w9
         VseA==
X-Forwarded-Encrypted: i=1; AJvYcCVkSzhGXebQ3iE6Wf5EB+VVyCwnWehU6vMi8DdxuHvD/B3YgKLavHvEPZcWvq69g+iuEskbaQHzEf+7hYBTj0YkSphwoB0TI6q41ZKko5FjDbI=
X-Gm-Message-State: AOJu0Yw3t67roRaSAeqqkCY6zjoGyVsrVrLdOnl1XwT/wnAyNXJgCUgN
	fEBHxLfzOjvOB3YKu+7O6PSxMLSEbI9i2StJSrFv9KqgRHXYOu7klxckBZksFKd8EZz9kO8qNV+
	32y0g7uI9oJITlfIgdmsUP/6zkQv0+IVm55IybJiJ/UEoAlsRDCIA3U3wJT9c4gN7u5EZ
X-Received: by 2002:ac8:7c50:0:b0:446:5ee0:d1e with SMTP id d75a77b69052e-44662e31cefmr112423941cf.39.1719954524174;
        Tue, 02 Jul 2024 14:08:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbWzDKoO3DLysrqALy+oE4lA7uiaZ1zyzV/oKjhpoDTKDIA4cjZJMXRmR71FRAQA9DolwanA==
X-Received: by 2002:ac8:7c50:0:b0:446:5ee0:d1e with SMTP id d75a77b69052e-44662e31cefmr112423701cf.39.1719954523863;
        Tue, 02 Jul 2024 14:08:43 -0700 (PDT)
Received: from thinkpad-p1.localdomain.com (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-446514b0b1dsm44452501cf.79.2024.07.02.14.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 14:08:43 -0700 (PDT)
From: Radu Rendec <rrendec@redhat.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] net: rswitch: Avoid use-after-free in rswitch_poll()
Date: Tue,  2 Jul 2024 17:08:37 -0400
Message-ID: <20240702210838.2703228-1-rrendec@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use-after-free is actually in rswitch_tx_free(), which is inlined in
rswitch_poll(). Since `skb` and `gq->skbs[gq->dirty]` are in fact the
same pointer, the skb is first freed using dev_kfree_skb_any(), then the
value in skb->len is used to update the interface statistics.

Let's move around the instructions to use skb->len before the skb is
freed.

This bug is trivial to reproduce using KFENCE. It will trigger a splat
every few packets. A simple ARP request or ICMP echo request is enough.

Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index dcab638c57fe8..24c90d8f5a442 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -871,13 +871,13 @@ static void rswitch_tx_free(struct net_device *ndev)
 		dma_rmb();
 		skb = gq->skbs[gq->dirty];
 		if (skb) {
+			rdev->ndev->stats.tx_packets++;
+			rdev->ndev->stats.tx_bytes += skb->len;
 			dma_unmap_single(ndev->dev.parent,
 					 gq->unmap_addrs[gq->dirty],
 					 skb->len, DMA_TO_DEVICE);
 			dev_kfree_skb_any(gq->skbs[gq->dirty]);
 			gq->skbs[gq->dirty] = NULL;
-			rdev->ndev->stats.tx_packets++;
-			rdev->ndev->stats.tx_bytes += skb->len;
 		}
 		desc->desc.die_dt = DT_EEMPTY;
 	}
-- 
2.45.2


