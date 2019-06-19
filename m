Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE0F4BD25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 17:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfFSPlT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 11:41:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42234 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfFSPlT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 11:41:19 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C8A1333
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2019 17:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560958877;
        bh=p3jo4l4yYYqDLP2QsuOuWK2Nli8txI1k75tsUvXiftU=;
        h=From:To:Subject:Date:From;
        b=Ee1z6zZjhWnfFnIfevvMrc+8V918z1Lj5UPuQwgSzINa7/z1tExoSZ8fq5KXO1Nas
         3g/i8lgjbun7fjFnas0ZrG+hkZBC8RpzgXeY4YC+cyPuWIr/Ib316KuwkxsGL1MpfH
         Py/QSjNZ+4bfnOQfwjvyheJaViL9zuO+S8Y8S5UM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] meson: Link against libc++ with compiling with clang
Date:   Wed, 19 Jun 2019 18:40:56 +0300
Message-Id: <20190619154056.32215-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

libc++ is used by Chrome OS, and likely as well by other environments
based on clang. Using it by default if available when compiling with
clang will help extending the compile-testing coverage. The drawback is
that issues specific to clang with libstdc++ will not be caught as
easily, but based on the experience with clang so far, code compiling
correctly with gcc/libstdc++ has failed with clang due to either
clang-specific or libc++-specific behaviour, never due only to the
combination of clang with libstdc++.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Make the libc++ dependency optional
---
 meson.build | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meson.build b/meson.build
index 4d3e99d3e58f..a3b0bc820072 100644
--- a/meson.build
+++ b/meson.build
@@ -28,8 +28,17 @@ common_arguments = [
 c_arguments = common_arguments
 cpp_arguments = common_arguments
 
+# Use libc++ by default if available instead of libstdc++ when compiling with
+# clang.
+if cc.get_id() == 'clang' and cc.find_library('libc++', required: false).found()
+    cpp_arguments += [
+        '-stdlib=libc++',
+    ]
+endif
+
 add_project_arguments(c_arguments, language : 'c')
 add_project_arguments(cpp_arguments, language : 'cpp')
+add_project_link_arguments(cpp_arguments, language : 'cpp')
 
 libcamera_includes = include_directories('include')
 
-- 
Regards,

Laurent Pinchart

